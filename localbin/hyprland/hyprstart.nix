{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprstart" = {
  executable = true;
  text = ''
#!/usr/bin/env bash

cd ~
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export GTK_THEME=Sweet-nova:dark
export WLR_NO_HARDWARE_CURSORS=1
${pkgs.hyprland}/bin/Hyprland
  '';
  };
};

}
