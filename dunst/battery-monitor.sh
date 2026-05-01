#!/bin/bash
# Poll battery every 3 minutes, send dunst notification when low
# Run via cron or systemd timer: */3 * * * * ~/.config/dunst/battery-monitor.sh

CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
STATUS=$(cat /sys/class/power_supply/BAT1/status 2>/dev/null)

[ -z "$CAPACITY" ] && exit 0
[ "$STATUS" = "Charging" ] && exit 0

if [ "$CAPACITY" -le 20 ]; then
    notify-send -a battery-monitor -u critical "Battery Critical" "${CAPACITY}% remaining"
elif [ "$CAPACITY" -le 30 ]; then
    notify-send -a battery-monitor -u normal "Battery Low" "${CAPACITY}% remaining"
fi
