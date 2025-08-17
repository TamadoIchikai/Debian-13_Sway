#!/bin/sh
current_layout=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .parent.layout')
if [ "$current_layout" = "tabbed" ]; then
	swaymsg layout tabbed
else    
	swaymsg layout toggle split
fi
