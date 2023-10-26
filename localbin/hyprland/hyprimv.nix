{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprimv" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

COUNTWINDOW=$(pgrep imv | wc -l)

if [ "$COUNTWINDOW" == "2" ]; then
  if [ -n "$(pidof waybar)" ]; then
    pkill waybar
  fi
  hyprctl keyword general:layout dwindle
  hyprctl keyword general:gaps_in 0
  hyprctl keyword general:gaps_out 0
  hyprctl dispatch layoutmsg preselect r
  hyprctl notify 1 1000 "rgb(00FF00)" " DWINDLE LAYOUT"
fi

${pkgs.imv}/bin/imv-dir "$1"
  '';
  };
};

}
