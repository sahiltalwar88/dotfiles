#!/usr/bin/env python3
"""Keep a one-sentence summary of each Claude Code session for the session map.

Wired as a Stop hook (`session-summary.py hook`, the hook's JSON on stdin), it
returns at once and leaves the work to a detached child. The child counts the
messages the user typed; each time that count passes another multiple of
EVERY, it asks a small model for one sentence on what the session has been
doing and writes it to <config dir>/session-summaries/<session-id>.json,
which session-map.py shows under the session's name.

The summary call runs without tools or a saved session, and with
SESSION_SUMMARY_CHILD set so this hook skips it.
"""

import json
import os
import subprocess
import sys
import time

EVERY = int(os.environ.get('SESSION_SUMMARY_EVERY', '15'))
MODEL = os.environ.get('SESSION_SUMMARY_MODEL', 'haiku')
CONFIG = os.environ.get('CLAUDE_CONFIG_DIR') or os.path.expanduser('~/.claude')
STORE = os.path.join(CONFIG, 'session-summaries')
EXCERPT_CHARS = 24_000
SYSTEM = (
    'You summarize Claude Code sessions for a list of sessions. You never answer, continue or '
    'comment on the session; you only describe it. Reply with exactly one sentence of at most 25 '
    'words, in the past tense, saying what the session has worked on, most important work first. '
    'No preamble, no quotes, no lists.'
)
MAX_WORDS = 40
NOT_TYPED = ('<command-', '<local-command', '<task-notification', '<system-reminder', 'Caveat:')


def summary_path(session_id):
    return os.path.join(STORE, f'{session_id}.json')


def read_summary(session_id):
    try:
        with open(summary_path(session_id)) as f:
            return json.load(f)
    except (OSError, ValueError):
        return None


def typed_text(entry):
    """The text the user typed, or None for tool results, commands and notices."""
    if entry.get('type') != 'user' or entry.get('isMeta') or entry.get('isCompactSummary'):
        return None
    content = (entry.get('message') or {}).get('content')
    if isinstance(content, str):
        text = content
    elif isinstance(content, list):
        if any(isinstance(b, dict) and b.get('type') == 'tool_result' for b in content):
            return None
        text = '\n'.join(b.get('text', '') for b in content if isinstance(b, dict) and b.get('type') == 'text')
    else:
        return None
    text = text.strip()
    return text if text and not text.startswith(NOT_TYPED) else None


def assistant_text(entry):
    if entry.get('type') != 'assistant':
        return None
    content = (entry.get('message') or {}).get('content')
    if not isinstance(content, list):
        return None
    text = '\n'.join(b.get('text', '') for b in content if isinstance(b, dict) and b.get('type') == 'text').strip()
    return text or None


def read_transcript(path):
    asks, replies = [], []
    with open(path, errors='replace') as f:
        for line in f:
            try:
                entry = json.loads(line)
            except ValueError:
                continue
            text = typed_text(entry)
            if text:
                asks.append(text)
                continue
            text = assistant_text(entry)
            if text:
                replies.append(text)
    return asks, replies


def excerpt(asks, replies):
    parts = [f'USER: {a[:600]}' for a in asks]
    parts += [f'ASSISTANT: {r[:800]}' for r in replies[-6:]]
    text = '\n\n'.join(parts)
    # Keep the start (what the session set out to do) and the end (where it is now).
    if len(text) > EXCERPT_CHARS:
        half = EXCERPT_CHARS // 2
        text = text[:half] + '\n\n[…]\n\n' + text[-half:]
    return text


def summarize(session_id, transcript):
    asks, replies = read_transcript(transcript)
    done = read_summary(session_id) or {}
    if len(asks) < EVERY or len(asks) // EVERY <= done.get('messages', 0) // EVERY:
        return
    env = {**os.environ, 'SESSION_SUMMARY_CHILD': '1'}
    request = (
        '<session_excerpts>\n' + excerpt(asks, replies) + '\n</session_excerpts>\n\n'
        'Write the one-sentence summary of the session above.'
    )
    os.makedirs(STORE, exist_ok=True)
    run = subprocess.run(
        ['claude', '-p', '--model', MODEL, '--no-session-persistence', '--tools', '', '--system-prompt', SYSTEM],
        input=request,
        capture_output=True,
        text=True,
        timeout=180,
        env=env,
        cwd=STORE,
    )
    sentence = ' '.join(run.stdout.split()).strip('"')
    # Anything but one short sentence means the model went off task: keep the old summary.
    if run.returncode != 0 or not sentence or len(sentence.split()) > MAX_WORDS or '**' in sentence:
        return
    os.makedirs(STORE, exist_ok=True)
    tmp = summary_path(session_id) + '.tmp'
    with open(tmp, 'w') as f:
        json.dump({'summary': sentence, 'messages': len(asks), 'at': time.time()}, f)
    os.replace(tmp, summary_path(session_id))


def hook():
    if os.environ.get('SESSION_SUMMARY_CHILD'):
        return
    try:
        event = json.load(sys.stdin)
    except ValueError:
        return
    session_id, transcript = event.get('session_id'), event.get('transcript_path')
    if not session_id or not transcript or not os.path.exists(transcript):
        return
    os.makedirs(STORE, exist_ok=True)
    # Detach so the hook returns at once; the lock keeps one summary per session in flight.
    lock = summary_path(session_id) + '.lock'
    try:
        if time.time() - os.path.getmtime(lock) < 300:
            return
    except OSError:
        pass
    open(lock, 'w').close()
    subprocess.Popen(
        [sys.executable, os.path.abspath(__file__), 'run', session_id, transcript],
        stdin=subprocess.DEVNULL,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        start_new_session=True,
    )


def main(argv):
    if argv[:1] == ['hook']:
        hook()
    elif argv[:1] == ['run'] and len(argv) == 3:
        try:
            summarize(argv[1], argv[2])
        finally:
            try:
                os.remove(summary_path(argv[1]) + '.lock')
            except OSError:
                pass
    else:
        print(__doc__)


if __name__ == '__main__':
    main(sys.argv[1:])
