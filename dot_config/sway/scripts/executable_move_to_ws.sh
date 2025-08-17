#!/bin/sh
current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true).num')

if [ "$1" = "next" ]; then
	target_ws=$((current_ws + 1))
  elif [ "$1" = "prev" ]; then
	target_ws=$((current_ws - 1))
  else
	exit 1
fi

if [ "$target_ws" -lt 1 ]; then
	exit 0
fi
swaymsg "move container to workspace number $target_ws, workspace number $target_ws"
