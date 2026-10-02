#!/usr/bin/env bash
# The session-map scan: titles from the session logs and names from the live
# registry. $1 is a file-name glob for the logs (one session's ID, or * for all).
base="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
cd "$base/projects" 2>/dev/null || exit 0
echo '@@FILES'
find . -mindepth 2 -maxdepth 2 -name "$1.jsonl" -printf '%T@\t%P\n'
echo '@@TITLES'
find . -mindepth 2 -maxdepth 2 -name "$1.jsonl" -print0 \
  | xargs -0 -r grep -a -H -o -E '"type":"(custom-title|ai-title|agent-name)",("sessionId":"[^"]*",)?"(customTitle|aiTitle|agentName)":"([^"\\]|\\.)*"' \
  | awk '{ i = index($0, ".jsonl:"); k = substr($0, 1, i) substr($0, i + 7, 22); last[k] = $0 } END { for (k in last) print last[k] }'
echo '@@LIVE'
for f in "$base"/sessions/[0-9]*.json; do
  [ -e "$f" ] || continue
  p=$(basename "$f" .json)
  state=dead
  if kill -0 "$p" 2>/dev/null; then
    state=alive
    # A reused PID is not the session: on Linux, match the recorded start time.
    if [ -r "/proc/$p/stat" ]; then
      start=$(sed 's/.*) //' "/proc/$p/stat" | cut -d' ' -f20)
      grep -q "\"procStart\":\"$start\"" "$f" || state=dead
    fi
  fi
  printf '%s\t' "$state"; tr -d '\n' < "$f"; echo
done
