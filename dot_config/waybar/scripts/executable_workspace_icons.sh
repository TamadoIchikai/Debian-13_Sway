#!/usr/bin/env bash
# Dependencies: jq, Nerd Font

set -euo pipefail

swaymsg -t get_tree | jq -rc '
  # icon map (edit to taste)
  def icon_for($a):
    ($a|ascii_downcase) as $x
    | if   ($x|test("^(firefox|org\\.mozilla\\.firefox)$"))        then ""
      elif ($x|test("^(google-chrome|chromium|brave-browser|vivaldi-stable|microsoft-edge|edge)$")) then ""
      elif ($x|test("^(code|code-oss|vscodium)$"))                 then "󰨞"
      elif ($x|test("^(alacritty|kitty|wezterm|foot|gnome-terminal|xfce4-terminal|termite|konsole|tilix|xterm)$")) then ""
      elif ($x|test("^spotify(-launcher)?$"))                      then ""
      elif ($x|test("^(thunar|org\\.gnome\\.nautilus|nautilus|pcmanfm|dolphin|nemo|ranger)$")) then ""
      elif ($x|test("^(vlc|mpv|celluloid)$"))                      then ""
      elif ($x|test("^(telegram-desktop|org\\.telegram\\.desktop)$")) then ""
      elif ($x|test("^obsidian$"))                                 then "󰺿"
      elif ($x|test("^slack$"))                                    then ""
      elif ($x|test("^(discord|com\\.discordapp\\.discord)$"))     then ""
      elif ($x|test("^(gimp|org\\.gimp\\.gimp|inkscape|org\\.inkscape\\.inkscape)$")) then ""
      elif ($x|test("^thunderbird$"))                              then ""
      elif ($x|test("^(nvim-qt|neovide|neovim|emacs|gedit|kate)$")) then ""
      elif ($x|test("^(feh|imv|swappy|org\\.gnome\\.eog|eog)$"))   then ""
      elif ($x|test("^(pavucontrol|helvum|qjackctl|easyeffects|org\\.pipewire\\.helvum)$")) then ""
      elif ($x|test("^steam$"))                                    then ""
      else "" end;

  # collect workspaces (skip __i3_scratch)
  [ .. | objects | select(.type? == "workspace") | select(.name != "__i3_scratch")
    | {
        name,
        focused,
        apps: [ (.. | objects
                 | select(.type? == "con" or .type? == "floating_con")
                 | select((.nodes // []) == [] and (.floating_nodes // []) == [])
                 | (.app_id // .window_properties.class // .window_properties.instance // "unknown")
               ) ]
      }
  ] as $wss

  # render rows
  | (
      $wss
      | map(
          {
            name,
            label: ( (.name | split(":")[0]) // .name ),
            focused,
            icons: (if (.apps | length) == 0 then ["·"]
                    else (.apps | map(icon_for(.)) | unique) end)
          }
        )
    ) as $rows
  | {
      text: ($rows
        | map( if .focused
               then "<span underline=\"single\" weight=\"bold\">" + (.label + " " + (.icons|join(" "))) + "</span>"
               else "<span>" + (.label + " " + (.icons|join(" "))) + "</span>"
               end
             )
        | join("  ")
      ),
      tooltip: ($rows | map(.name + ": " + (.icons|join(" "))) | join("\n")),
      class: "workspace-icons"
    }
'
