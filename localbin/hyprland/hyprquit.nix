{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprquit" = {
  executable = true;
  text = ''
#!/usr/bin/env sh

hyprctl dispatch exit
sleep 10
startx
  '';
  };
};

}
