{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprV" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

if hyprctl getoption general:layout | grep 'master';then
  hyprctl keyword general:layout dwindle
  hyprctl keyword general:gaps_in 0
  hyprctl keyword general:gaps_out 0
  hyprctl dispatch layoutmsg preselect l
  hyprctl keyword general:layout master
  hyprctl keyword general:layout dwindle
  hyprctl notify 1 1000 "rgb(00FF00)" " DWINDLE LAYOUT"
else
  hyprctl keyword general:layout master
  hyprctl keyword general:gaps_in 5
  hyprctl keyword general:gaps_out 5
  hyprctl notify 1 1000 "rgb(00FF00)" " MASTER LAYOUT"
fi
  '';
  };
};

}
