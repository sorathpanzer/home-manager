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
    ./config/mimeapps.nix
    ./config/dir_colors.nix
    ./config/hyprland.nix
    ./config/waybar.nix
    ./config/qutebrowser.nix
    
    ./config/yazi/keymap.toml.nix
    ./config/yazi/theme.toml.nix
    ./config/yazi/yazi.toml.nix

    ./config/zsh/zsh.nix
    ./config/zsh/plugins/fzf.nix
    ./config/zsh/plugins/sudo.nix
    ./config/zsh/plugins/unicode.nix
    ./config/zsh/functions.nix

    ./assets.nix
    ./profile.nix

    ./localbin/apps/metatrader.nix
    ./localbin/apps/Wtf.nix

    ./localbin/bin/nx-config.nix
    ./localbin/bin/pkg.nix
    ./localbin/bin/syncpad.nix
    ./localbin/bin/vm.nix

    ./localbin/hyprland/12ft.nix
    ./localbin/hyprland/clpoweroff.nix
    ./localbin/hyprland/clreboot.nix
    ./localbin/hyprland/hyprbar.nix
    ./localbin/hyprland/hyprbg.nix
    ./localbin/hyprland/hyprimv.nix
    ./localbin/hyprland/hyprmpv.nix
    ./localbin/hyprland/hyprquit.nix
    ./localbin/hyprland/hyprspace.nix
    ./localbin/hyprland/hyprstart.nix
    ./localbin/hyprland/hyprV.nix
    ./localbin/hyprland/imvclose.nix
    ./localbin/hyprland/playvideo.nix
    ./localbin/hyprland/screenshot.nix
    ./localbin/hyprland/tofirun.nix
 
  ];

  }
