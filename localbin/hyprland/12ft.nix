{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/12ft" = {
  executable = true;
  text = ''
#!/bin/sh

url=$(${pkgs.wl-clipboard}/bin/wl-paste)
xdg-open https://12ft.io/$url
  '';
  };
};

}
