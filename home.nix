{ config, pkgs, ... }:

{
  imports = [
      ./imports.nix
  ];

  nixpkgs.overlays = [ (import ./overlays.nix) (import ./waybarlay.nix) ];

  home.username = "sorath";
  home.homeDirectory = "/home/sorath";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  hyprland waybar imv fzf keepassxc wl-clipboard tofi git OVMF dunst yazi pulseaudio
  qutebrowser-qt6 python310Packages.adblock python39Packages.pip python39Packages.six
  swaylock
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };
}

  # zsh-syntax-highlighting nodePackages.bash-language-server mediainfo trash-cli 
  # unar exiftool shellcheck fzf nvd sanoid tig helix zsh foot mpv zathura
  # wl-clipboard fwupd clamav bc swww udiskie tofi syncthing waybar 
  # qemu sanoid grim slurp
