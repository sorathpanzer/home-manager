{ pkgs, config, ... }:

{

home.file = {
  ".config/keepassxc/keepassxc.ini".text = ''
[General]
ConfigVersion=2

[GUI]
ApplicationTheme=dark

[PasswordGenerator]
AdditionalChars=
ExcludedChars=
'';
};

}
