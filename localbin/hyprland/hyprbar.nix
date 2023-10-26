{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprbar" = {
  executable = true;
  text = ''
#!/usr/bin/env bash

if [ -n "$(pidof waybar)" ]; then
  pkill waybar &
  hyprctl keyword general:gaps_in 0
  hyprctl keyword general:gaps_out 0
else
  waybar &
  hyprctl keyword general:gaps_in 5
  hyprctl keyword general:gaps_out 5
fi
  '';
  };
};

}
