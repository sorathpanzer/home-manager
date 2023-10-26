{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprspace" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

hyprctl dispatch killactive

ACTIVEWINDOW=$(hyprctl activewindow)

if [ "$ACTIVEWINDOW" == "Invalid" ]; then
  #hyprctl dispatch workspace e-1
  hyprctl dispatch workspace 1
fi
  '';
  };
};

}
