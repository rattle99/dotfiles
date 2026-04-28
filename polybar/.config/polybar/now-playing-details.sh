#!/usr/bin/env bash
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
album=$(playerctl metadata album 2>/dev/null)
position=$(playerctl metadata --format '{{duration(position)}}' 2>/dev/null)
length=$(playerctl metadata --format '{{duration(mpris:length)}}' 2>/dev/null)

[ -z "$title" ] && exit 0

notify-send "$title" "${artist}\n${album}\n${position} / ${length}"
