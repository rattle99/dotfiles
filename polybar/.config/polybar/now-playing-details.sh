#!/usr/bin/env bash
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
album=$(playerctl metadata album 2>/dev/null)
position=$(playerctl metadata --format '{{duration(position)}}' 2>/dev/null)
length=$(playerctl metadata --format '{{duration(mpris:length)}}' 2>/dev/null)
art_url=$(playerctl metadata mpris:artUrl 2>/dev/null)

[ -z "$title" ] && exit 0

art_path=""
if [[ "$art_url" == file://* ]]; then
    art_path="${art_url#file://}"
elif [[ "$art_url" == https://* ]]; then
    curl -s "$art_url" -o /tmp/polybar-album-art.jpg && art_path="/tmp/polybar-album-art.jpg"
fi

if [[ -n "$art_path" ]]; then
    notify-send -i "$art_path" "$title" "${artist}\n${album}\n${position} / ${length}"
else
    notify-send "$title" "${artist}\n${album}\n${position} / ${length}"
fi
