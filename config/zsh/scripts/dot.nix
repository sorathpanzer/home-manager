{ pkgs, config, ... }:

{

home.file = {
  ".config/zsh/scripts/dot".text = ''
#!/bin/sh

dot() {
CONFIG="$HOME/.config/dotgit/dotfiles/.config"

  rsync -Lar --chmod=ugo=rw --delete --info=progress2 \
    $HOME/.config/mpv \
    $HOME/.config/imv \
    $HOME/.config/helix \
    $HOME/.config/foot \
    $HOME/.config/keepassxc \
    $HOME/.config/tofi \
    $HOME/.config/dunst \
    $HOME/.config/tig \
    $HOME/.config/mimeapps.list \
    $HOME/.config/dir_colors \
    $HOME/.profile \
    $HOME/.zprofile \
    $HOME/.config/yazi $CONFIG
}
'';
};

}
