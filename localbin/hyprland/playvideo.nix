{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/playvideo" = {
  executable = true;
  text = ''
#!/bin/sh

echo "mpv --loop $(wl-paste)" >> $HOME/.cache/zsh/history
${pkgs.mpv}/bin/mpv --loop "$(${pkgs.wl-clipboard}/bin/wl-paste)"
  '';
  };
};

}
