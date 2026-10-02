#!/usr/bin/env python3
"""Print the session map: each Claude Code session's name and full ID.

Usage: session-map.py [--current <session-id>] [--all] [search text]

Without search text it lists the current directory's project, newest first;
search text matches names, automatic titles and IDs in every project; --all
lists every project. Names come from scan.sh beside this script: your /rename
name first, then the automatic title. A session's one-sentence summary, kept by
session-summary.py, is shown on the line below it.
"""

import json
import os
import re
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
SCAN = os.path.join(HERE, 'scan.sh')
UUID = re.compile(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')
TITLE = re.compile(
    r'"type":"(custom-title|ai-title|agent-name)",(?:"sessionId":"[^"]*",)?'
    r'"(?:customTitle|aiTitle|agentName)":("(?:[^"\\]|\\.)*")'
)
SLOT = {'custom-title': 'custom', 'ai-title': 'ai', 'agent-name': 'agent'}
LIMIT = 40
SUMMARIES = os.path.join(os.environ.get('CLAUDE_CONFIG_DIR') or os.path.expanduser('~/.claude'), 'session-summaries')


def project_key(path):
    return re.sub(r'[^A-Za-z0-9]', '-', path)


def split_log_path(rel):
    rel = rel.removeprefix('./')
    project, _, name = rel.partition('/')
    sid = name.removesuffix('.jsonl')
    return (project, sid) if UUID.match(sid) else None


def scan():
    out = subprocess.run(['bash', SCAN, '*'], capture_output=True, text=True, timeout=60).stdout
    files, titles, registry = [], {}, []
    section = ''
    for line in out.split('\n'):
        if line.startswith('@@'):
            section = line[2:].strip()
            continue
        if not line.strip():
            continue
        if section == 'FILES':
            mtime, _, rel = line.partition('\t')
            parsed = split_log_path(rel)
            if parsed:
                files.append({'project': parsed[0], 'id': parsed[1], 'ms': float(mtime) * 1000})
        elif section == 'TITLES':
            at = line.find('.jsonl:')
            parsed = split_log_path(line[: at + 6]) if at >= 0 else None
            m = TITLE.search(line[at + 7 :]) if parsed else None
            if m:
                try:
                    titles.setdefault(parsed[1], {})[SLOT[m.group(1)]] = json.loads(m.group(2))
                except ValueError:
                    pass
        elif section == 'LIVE':
            state, _, raw = line.partition('\t')
            try:
                entry = json.loads(raw)
            except ValueError:
                continue
            if entry.get('sessionId'):
                entry['alive'] = state == 'alive'
                registry.append(entry)
    return files, titles, registry


def build_rows(files, titles, registry):
    reg = {}
    for r in registry:
        prev = reg.get(r['sessionId'])
        if not prev or (r['alive'] and not prev['alive']) or r.get('updatedAt', 0) > prev.get('updatedAt', 0):
            reg[r['sessionId']] = r
    cwd_by_key = {project_key(r['cwd']): r['cwd'] for r in registry if r.get('cwd')}
    rows = {f['id']: {'id': f['id'], 'project': f['project'], 'ms': f['ms']} for f in files}
    for r in reg.values():
        if r['sessionId'] not in rows and r.get('cwd'):
            rows[r['sessionId']] = {'id': r['sessionId'], 'project': project_key(r['cwd']), 'ms': 0}
    out = []
    for row in rows.values():
        r = reg.get(row['id'], {})
        t = titles.get(row['id'], {})
        name = (
            t.get('custom')
            or t.get('agent')
            or (r.get('name') if r.get('nameSource') == 'user' else None)
            or t.get('ai')
            or r.get('name')
        )
        out.append({
            **row,
            'ms': max(row['ms'], r.get('updatedAt', 0)),
            'path': cwd_by_key.get(row['project'], row['project']),
            'name': name or '(untitled)',
            'auto': t['ai'] if t.get('ai') and t['ai'] != name else None,
            'live': bool(r.get('alive')),
        })
    return out


def summary_of(session_id):
    try:
        with open(os.path.join(SUMMARIES, f'{session_id}.json')) as f:
            return json.load(f)
    except (OSError, ValueError):
        return None


def ago(ms, now_ms):
    s = max(0, round((now_ms - ms) / 1000))
    if s < 60:
        return 'just now'
    if s < 3600:
        return f'{s // 60}m ago'
    if s < 86400:
        return f'{s // 3600}h ago'
    if s < 7 * 86400:
        return f'{s // 86400}d ago'
    return time.strftime('%Y-%m-%d', time.localtime(ms / 1000))


def main(argv):
    current = None
    all_projects = False
    words = []
    it = iter(argv)
    for a in it:
        if a == '--current':
            current = next(it, None)
        elif a == '--all':
            all_projects = True
        else:
            words.append(a)
    query = ' '.join(words).strip().lower()
    here = os.getcwd()

    rows = build_rows(*scan())
    if query:
        rows = [r for r in rows if any(query in (s or '').lower() for s in (r['name'], r['auto'], r['id']))]
        scope = f'matching "{query}" in every project'
    elif all_projects:
        scope = 'in every project'
    else:
        rows = [r for r in rows if r['project'] == project_key(here)]
        scope = f'in {here}'
    rows.sort(key=lambda r: r['ms'], reverse=True)
    if not rows:
        print(f'No sessions {scope}.')
        return

    shown = rows[:LIMIT]
    width = min(48, max(12, *(len(r['name']) for r in shown)))
    now_ms = time.time() * 1000
    print(f'Sessions {scope}, newest first (▶ this one, ● open now):\n')
    for r in shown:
        mark = '▶' if r['id'] == current else '●' if r['live'] else ' '
        name = r['name'] if len(r['name']) <= width else r['name'][: width - 1] + '…'
        extra = [r['path'] if query or all_projects else '', f"auto: {r['auto']}" if r['auto'] else '']
        extra = ' · '.join(e for e in extra if e)
        print(f"{mark} {name:<{width}}  {r['id']}  {ago(r['ms'], now_ms):<10}{'  ' + extra if extra else ''}".rstrip())
        summary = summary_of(r['id'])
        if summary and summary.get('summary'):
            print(f"    ↳ {summary['summary']} ({ago(summary.get('at', 0) * 1000, now_ms)})")
    if len(rows) > LIMIT:
        print(f'  …and {len(rows) - LIMIT} older')


if __name__ == '__main__':
    main(sys.argv[1:])
