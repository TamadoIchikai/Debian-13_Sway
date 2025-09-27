#!/usr/bin/env bash
# toggle-blueman.sh: show blueman-manager from scratchpad, hide when unfocused

APP_ID="blueman-manager"
SWAYMSG=/usr/bin/swaymsg
JQ=/usr/bin/jq

# Show the window
$SWAYMSG "[app_id=\"$APP_ID\"] scratchpad show"
$SWAYMSG "[app_id=\"$APP_ID\"] floating enable, resize set 600 500, move position 100ppt 100ppt, move up 500px, move left 600px"

# Get window id
win_id=$($SWAYMSG -t get_tree | $JQ -r "
    recurse(.nodes[]?, .floating_nodes[]?)
    | select(.app_id? == \"$APP_ID\")
    | .id" | head -n1)

# If found, monitor focus until lost → send back to scratchpad
if [ -n "$win_id" ]; then
    while true; do
        focused=$($SWAYMSG -t get_tree | $JQ -r "
            recurse(.nodes[]?, .floating_nodes[]?)
            | select(.id == $win_id)
            | .focused")
        if [ "$focused" = "false" ]; then
            $SWAYMSG "[con_id=$win_id]" move scratchpad
            break
        fi
        sleep 0.3
    done
fi

