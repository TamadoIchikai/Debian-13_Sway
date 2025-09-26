#!/bin/bash
#
# MIT License
#
# Wayland color picker using slurp + grim + convert
# Copies color directly to clipboard (no dialog).
#

# Check if running under wayland
if [ -z "$WAYLAND_DISPLAY" ]; then
    echo "This color picker must be run under a valid Wayland session." >&2
    exit 1
fi

# Get color position
position=$(slurp -b 00000000 -p)

# Sleep briefly to avoid grim timing issues
sleep 0.2

# Extract hex color value
if command -v /usr/bin/gm &> /dev/null; then
    color=$(grim -g "$position" -t png - \
        | /usr/bin/gm convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | rev | cut -d ' ' -f 1 | rev
    )
else
    color=$(grim -g "$position" -t png - \
        | convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | cut -d ' ' -f 4
    )
fi

notify-send "Color picked" "$color"

echo "$color" | wl-copy -n


