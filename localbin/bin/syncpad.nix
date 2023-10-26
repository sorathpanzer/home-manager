{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/syncpad" = {
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
  ex) expor

# Decrypt Crypta volume in TrueNAS
  RELEASE=$(cat /etc/os-release | grep ^NAME= | cut -d '=' -f2 | awk '{print $1}' | tr -d '"')

  if [ $RELEASE = Void ] || [ $RELEASE = Alpine ]; then
    SUDOAS="doas"
  else
    SUDOAS="sudo"
  fi

if [ -z "$(ls -A /run/media/sorath/Legion)" ]; then
  $SUDOAS zpool import -l -R /run/media/sorath Legion
fi

if [ "$(ls -A /run/media/sorath/Legion)" ]; then
  #DISK="/media/Legion/Crypta/BackHome"
  DISK="root@192.168.1.120:/mnt/Bunker/Crypta/BackHome"

  rsync -ar --info=progress2 --delete \
    $HOME/Documentos \
    $HOME/Imagens \
    $HOME/Música \
    $HOME/Vídeos \
    $HOME/Transferências \
    $HOME/Syncthing \
    $HOME/.ssh \
    $HOME/.themes \
    $HOME/.icons $DISK

  rsync -ar --info=progress2 --delete $HOME/.local/share/qutebrowser $DISK/.local/share
  rsync -ar --info=progress2 --delete $HOME/.cache/zsh/history $DISK/.cache/zsh

  $SUDOAS ${pkgs.sanoid}/bin/syncoid --no-privilege-elevation root@192.168.1.120:Bunker/Crypta Legion/Crypta
  $SUDOAS ${pkgs.sanoid}/bin/syncoid --no-privilege-elevation root@192.168.1.120:Bunker/Vault Legion/Vault
fi
  '';
  };
};

}
