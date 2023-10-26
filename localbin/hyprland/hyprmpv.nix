{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprmpv" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

hyprctl dispatch killactive

COUNTWINDOW=$(pgrep mpv | wc -l)

if [ "$COUNTWINDOW" == "1" ]; then
  hyprctl dispatch workspace 1
fi
  '';
  };
};

}
