{ config, pkgs, ... }:

{
  imports = [
    ./config/mpv.nix
    ./config/imv.nix
    ./config/helix/helix.nix
    ./config/dunst/dunst.nix
    ./config/foot.nix
    ./config/tig.nix
    ./config/keepassxc.nix
    ./config/tofi.nix
    ./config/zathura.nix
    ./config/profile.nix
    ./config/mimeapps.nix
    ./config/dir_colors.nix
 
    ./config/yazi/keymap.toml.nix
    ./config/yazi/theme.toml.nix
    ./config/yazi/yazi.toml.nix

    ./config/zsh/zsh.nix
    ./config/zsh/plugins/fzf.nix
    ./config/zsh/plugins/sudo.nix
    ./config/zsh/plugins/unicode.nix
    ./config/zsh/functions.nix
  ];

  }
