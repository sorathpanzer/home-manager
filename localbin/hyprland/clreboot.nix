{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/clreboot" = {
  executable = true;
  text = ''
#!/bin/sh

RELEASE=$(cat /etc/os-release | grep ^NAME= | cut -d '=' -f2 | awk '{print $1}' | tr -d '"')

if [ $RELEASE = Void ] || [ $RELEASE = Alpine ]; then
  SUDOAS="doas"
else
  SUDOAS="sudo"
fi

windows=$(xdotool search --onlyvisible --name .)

for i in $windows; do
  xdotool windowclose $i
done

$SUDOAS reboot
  '';
  };
};

}
