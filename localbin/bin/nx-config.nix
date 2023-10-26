{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/nx-config" = {
  executable = true;
  text = ''
#!/usr/bin/env bash

import()
{
  FILE=$(ls ~/Documentos/nixos | ${pkgs.fzf}/bin/fzf)
  cat ~/Documentos/nixos/$FILE | sudo tee /etc/nixos/configuration.nix
}

export()
{
  cat /etc/nixos/configuration.nix | tee ~/Documentos/nixos/$(ls ~/Documentos/nixos | ${pkgs.fzf}/bin/fzf)
}

case "''${1}" in
  "") sudo -E ${pkgs.helix}/bin/hx /etc/nixos/configuration.nix ;;
  in) import ;;
  ex) export ;;
esac
  '';
  };
};

}
