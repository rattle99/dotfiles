#!/usr/bin/env bash
[ -f ~/.config/colorice/colors.sh ] && source ~/.config/colorice/colors.sh

NB="${COLORICE_BACKGROUND:-#191724}"
NF="${COLORICE_FOREGROUND:-#e3c7fc}"
SB="${COLORICE_COLOR4:-#bd93f9}"
SF="${COLORICE_BACKGROUND:-#191724}"

exec dmenu_run \
    -nb "$NB" \
    -nf "$NF" \
    -sb "$SB" \
    -sf "$SF" \
    -h 28 \
    "$@"
