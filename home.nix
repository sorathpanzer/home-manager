{ config, pkgs, ... }:

{
  imports = [
      ./imports.nix
  ];

  nixpkgs.overlays = [ (import ./overlays.nix) (import ./waybarlay.nix) ];
  # nixpkgs.overlays = [(import ./waybarlay.nix) ];

  home.username = "sorath";
  home.homeDirectory = "/home/sorath";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  hyprland waybar imv fzf keepassxc wl-clipboard tofi git OVMF dunst pulseaudio #yazi
  qutebrowser python310Packages.adblock python39Packages.pip python39Packages.six

  gcc gnumake btrfs-progs ntfs3g openssh light lm_sensors pandoc poppler_utils
  ffmpeg ffmpegthumbnailer groff imagemagick file zip killall fd marksman
  virt-manager spice libvirt bridge-utils emacs slides graph-easy 
  wayland-protocols ydotool hyprpicker usbutils yt-dlp ripgrep lzop lf ghostscript
  librewolf popcorntime libreoffice-still tdesktop fragments signal-desktop logseq
  whatsapp-for-linux swaylock xdg-user-dirs 
  #appimage-run android-udev-rules android-file-transfer android-tools
  #wineWowPackages.waylandFull
  
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "librewolf";
  };

  programs.home-manager.enable = true;
  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "daily";
  };
}

  # zsh-syntax-highlighting nodePackages.bash-language-server mediainfo trash-cli 
  # unar exiftool shellcheck fzf nvd sanoid tig helix zsh foot mpv zathura
  # wl-clipboard fwupd clamav bc swww udiskie tofi syncthing waybar 
  # qemu sanoid grim slurp
