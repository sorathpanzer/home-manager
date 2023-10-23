{ pkgs, config, ... }:

{
  
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font="UbuntuMono Nerd Font:size=9";
        letter-spacing=0;
        dpi-aware="yes";
        pad="4x4";
      };  
      cursor.color="282a36 f8f8f2";
      colors = {
         alpha=0.4;
         foreground="f8f8f2";
         background="000000";
         regular0="3D4C5F";  # black
         regular1="EE4F84";  # red
         regular2="53E2AE";  # green
         regular3="F1FF52";  # yellow
         regular4="6498EF";  # blue
         regular5="985EFF";  # magenta
         regular6="24D1E7";  # cyan
         regular7="E5E5E5";  # white
         bright0="56687E";  # bright black
         bright1="F48FB1";  # bright red
         bright2="A1EFD3";  # bright green
         bright3="F1FA8C";  # bright yellow
         bright4="92B6F4";  # bright blue
         bright5="BD99FF";  # bright magenta
         bright6="87DFEB";  # bright cyan
         bright7="F8";
      };
    };
  };

}