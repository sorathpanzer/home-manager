{ config, pkgs, ... }:

{
  imports = [
      ./imports.nix
  ];

  nixpkgs.overlays = [ (import ./overlays.nix) ];

  home.username = "sorath";
  home.homeDirectory = "/home/sorath";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
  imv fzf keepassxc tofi git swww neovim #yazi
  
  # zsh-syntax-highlighting nodePackages.bash-language-server mediainfo trash-cli 
  # unar exiftool shellcheck fzf nvd sanoid tig dunst helix zsh foot mpv zathura
  # wl-clipboard fwupd clamav bc

  # stow (DEPRECATED)
  # yazi is referenced in zsh functions
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
