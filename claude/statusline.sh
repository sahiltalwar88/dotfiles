#!/usr/bin/env bash
# Status line: machine load across every session, plus this session's context.
# Settings: "statusLine": {"type": "command", "command": "~/.claude/statusline.sh"}
input=$(cat)

avail_kb=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
swap_used_kb=$(awk '/SwapTotal/ {t=$2} /SwapFree/ {f=$2} END {print t-f}' /proc/meminfo)
free_g=$(awk -v k="$avail_kb" 'BEGIN {printf "%.1f", k/1048576}')
swap_g=$(awk -v k="$swap_used_kb" 'BEGIN {printf "%.1f", k/1048576}')
captures=$(pgrep -fc '^node (\S*/)?scripts/(shoot|page-shot|load-time|leader-check)\.cjs' 2>/dev/null); captures=${captures:-0}
sessions=$(pgrep -fc 'claude.*stream-json|/claude( |$)' 2>/dev/null); sessions=${sessions:-0}
ctx=$(printf '%s' "$input" | grep -o '"used_percentage": *[0-9.]*' | head -1 | grep -o '[0-9.]*$')

red=$'\e[31m'; yellow=$'\e[33m'; dim=$'\e[2m'; off=$'\e[0m'
ram_colour=$dim
(( avail_kb < 2097152 )) && ram_colour=$red
(( avail_kb >= 2097152 && avail_kb < 4194304 )) && ram_colour=$yellow
cap_colour=$dim
(( captures > 1 )) && cap_colour=$red
(( captures == 1 )) && cap_colour=$yellow

line="${ram_colour}RAM ${free_g}G free${off}${dim} · swap ${swap_g}G${off} · ${cap_colour}${captures} capture(s) running${off}${dim} · ${sessions} sessions${off}"
[[ -n $ctx ]] && line+="${dim} · context ${ctx%.*}%${off}"
printf '%s\n' "$line"
