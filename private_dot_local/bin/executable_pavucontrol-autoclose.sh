
#!/usr/bin/env bash
# toggle-pavucontrol.sh: show pavucontrol from scratchpad, hide when unfocused

SWAYMSG=/usr/bin/swaymsg
JQ=/usr/bin/jq

# Show the window
$SWAYMSG '[app_id="pavucontrol" title="Volume Control"] scratchpad show'
$SWAYMSG '[app_id="pavucontrol" title="Volume Control"] floating enable, resize set 700 500, move position 100ppt 100ppt, move up 500px, move left 710px'

# Get window id (match by app_id OR window name)
win_id=$($SWAYMSG -t get_tree | $JQ -r '
    recurse(.nodes[]?, .floating_nodes[]?)
    | select(.app_id? == "pavucontrol" or .name? == "Volume Control")
    | .id' | head -n1)

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

