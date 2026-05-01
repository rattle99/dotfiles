#!/bin/bash
# Event-driven mpris status for polybar (tail = true)
# Outputs one line per state change; clears after 5 min of pause/stop

CLEAR_DELAY=300
_clear_pid=""

while IFS= read -r line; do
    status="${line%%|*}"
    title="${line#*|}"

    [ -n "$_clear_pid" ] && kill "$_clear_pid" 2>/dev/null
    _clear_pid=""

    case "$status" in
        Playing)
            t="$title"
            [ "${#t}" -gt 40 ] && t="${t:0:40}…"
            echo "󰝚 $t"
            ;;
        Paused|Stopped)
            { sleep "$CLEAR_DELAY" && echo ""; } &
            _clear_pid=$!
            ;;
    esac
done < <(playerctl --follow metadata --format '{{status}}|{{title}}' 2>/dev/null)

echo ""
