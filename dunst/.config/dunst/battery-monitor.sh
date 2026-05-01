#!/bin/bash
# Adaptive battery monitor daemon — start from i3 exec
# Polls /sys every 5min (>60%), 3min (40-60%), 1min (<40%)
# Notifies once per threshold crossing, resets on charge

[ "$(pgrep -c -f battery-monitor.sh)" -gt 1 ] && exit 0

_last_notified=100

while true; do
    CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
    STATUS=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)

    if [ "$STATUS" = "Charging" ]; then
        _last_notified=100
    elif [ -n "$CAPACITY" ]; then
        if [ "$CAPACITY" -le 20 ] && [ "$_last_notified" -gt 20 ]; then
            notify-send -a battery-monitor -u critical "Battery Critical" "${CAPACITY}% remaining"
            _last_notified=20
        elif [ "$CAPACITY" -le 30 ] && [ "$_last_notified" -gt 30 ]; then
            notify-send -a battery-monitor -u normal "Battery Low" "${CAPACITY}% remaining"
            _last_notified=30
        fi
    fi

    if [ -z "$CAPACITY" ] || [ "$CAPACITY" -gt 60 ]; then
        sleep 300
    elif [ "$CAPACITY" -gt 40 ]; then
        sleep 180
    else
        sleep 60
    fi
done
