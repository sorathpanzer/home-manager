{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/imvclose" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

hyprctl dispatch killactive

COUNTWINDOW=$(pgrep imv | wc -l)

if [ "$COUNTWINDOW" == "3" ]; then
  hyprctl keyword general:layout master
  hyprctl keyword general:gaps_in 5
  hyprctl keyword general:gaps_out 5
  hyprctl notify 1 1000 "rgb(00FF00)" " MASTER LAYOUT"
fi

if [ "$COUNTWINDOW" == "1" ]; then
  hyprctl dispatch workspace 1
fi
  '';
  };
};

}
