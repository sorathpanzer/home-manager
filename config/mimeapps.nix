{ pkgs, config, ... }:

{

xdg.mimeApps = {
  enable = true;
  defaultApplications = {
    "image/jpeg"="hyprimv.desktop";
    "image/png"="hyprimv.desktop";
    "image/bmp"="hyprimv.desktop";
    "image/gif"="hyprimv.desktop";
    "image/webp"="hyprimv.desktop";
    "application/pdf"="org.pwmt.zathura-ps.desktop";
    "x-scheme-handler/tg"="userapp-Telegram Desktop-ZZSVU1.desktop";
    "x-scheme-handler/about"="librewolf.desktop";
    "x-scheme-handler/unknown"="librewolf.desktop";
  };
};
}
