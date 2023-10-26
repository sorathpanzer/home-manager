{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/tofirun" = {
  executable = true;
  text = ''
#!/bin/sh

$(cat $HOME/.config/tofi/assets/appmenu | ${pkgs.tofi}/bin/tofi)
  '';
  };
};

}