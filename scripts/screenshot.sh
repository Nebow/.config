#!/bin/sh

#
# Script that takes a screenshot of:
#  "window" - The active window, including borders
#  "select" - A selection the user makes
# Placing it into the ~/screenshots/ directory and into the clipboard

TYPE=$1

mkdir -p ~/screenshots
if [ $1 == "window" ]; then
  SNIP_DIMENSIONS=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
elif [ $1 == "select" ]; then
  SNIP_DIMENSIONS=$(slurp)
fi

if [ "$SNIP_DIMENSIONS" != "selection cancelled" ]; then
  grim -g "$SNIP_DIMENSIONS" - | pngquant - | wl-copy -t image/png
  wl-paste > ~/screenshots/screenshot_$(date +'%Y%m%d_%H%M%S.png')
fi
