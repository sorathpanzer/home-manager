{ config, pkgs, ... }:

{
  imports = [
    ./config/mpv.nix
    ./config/imv.nix
    ./config/helix/helix.nix
    ./config/foot.nix
    ./config/tig.nix
    ./config/keepassxc.nix
    ./config/tofi.nix
    ./config/dunst/dunst.nix
 
    ./config/yazi/keymap.toml.nix
    ./config/yazi/theme.toml.nix
    ./config/yazi/yazi.toml.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sorath";
  home.homeDirectory = "/home/sorath";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
