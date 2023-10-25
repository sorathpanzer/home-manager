{ pkgs, config, ... }:

{

home.file = {
  ".config/zsh/scripts/functions".text = ''
#!/usr/bin/env bash

dot() {
  CONFIG="$HOME/.config/dotgit/dotfiles/.config"

  rsync -Lar --chmod=ugo=rw --delete --info=progress2 \
    $HOME/.config/mpv \
    $HOME/.config/imv \
    $HOME/.config/helix \
    $HOME/.config/foot \
    $HOME/.config/keepassxc \
    $HOME/.config/tofi \
    $HOME/.config/dunst \
    $HOME/.config/tig \
    $HOME/.config/mimeapps.list \
    $HOME/.config/dir_colors \
    $HOME/.profile \
    $HOME/.zprofile \
    $HOME/.config/yazi $CONFIG
}

pmos() {
  ${pkgs.pmbootstrap}/bin/pmbootstrap shutdown
  ${pkgs.pmbootstrap}/bin/pmbootstrap zap -p
  ${pkgs.pmbootstrap}/bin/pmbootstrap init
  ${pkgs.pmbootstrap}/bin/pmbootstrap install --android-recovery-zip
  ${pkgs.pmbootstrap}/bin/pmbootstrap flasher --method=adb sideload
}

twrp() {
  sudo ${pkgs.android-tools}/bin/adb reboot bootloader
  sudo ${pkgs.android-tools}/bin/fastboot flash recovery $HOME/Transferências/Mobile/twrp.img
  sudo ${pkgs.android-tools}/bin/fastboot reboot
}

wg-toggle() {
  if [[ "$(sudo wg)" != "" ]]; then
    sudo wg-quick down wg0
  else
      sudo wg-quick up wg0
  fi
}

2mob()
{
  book="$(ls *.pdf | fzf)"
  ebook-convert "$book" "$(echo "$book" | cut -f1 -d ".")".mobi --enable-heuristics
}

mp3()
{
  yt-dlp -x --audio-format mp3 "$(${pkgs.wl-clipboard}/bin/wl-paste)"
}

mp4()
{
  yt-dlp "$(${pkgs.wl-clipboard}/bin/wl-paste)"
}

mpl()
{
  mpv "$(${pkgs.wl-clipboard}/bin/wl-paste)"
}

blue() {
  BLUE=$(bluetoothctl info)

  if [[ $BLUE == "Missing device address argument" ]]; then
    bluetoothctl power on
    bluetoothctl pair 00:02:3C:83:0C:8B
    bluetoothctl connect 00:02:3C:83:0C:8B
  fi

  if [[ $BLUE != "Missing device address argument" ]]; then
    bluetoothctl power off
  fi
}

fwupd() {
  sudo ${pkgs.fwupd}/bin/fwupdmgr refresh --force
  sudo ${pkgs.fwupd}/bin/fwupdmgr get-updates
  sudo ${pkgs.fwupd}/bin/fwupdmgr update
}

vscan() {
  echo "Procurar actualizações"
  ${pkgs.clamav}/bin/freshclam
  echo "Procurar malwares..."
  ${pkgs.clamav}/bin/clamscan -r --bell -i -o $HOME
}

iwf() {
  iwctl station wlan0 scan
  sleep 2
  SSID="$(iwctl station wlan0 get-networks | awk '{print $1}' | head -n -1 | tail -n +5 | fzf)"
  iwctl station wlan0 connect $SSID
}

ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

fkill() {
  process=$(ps -ef | fzf | awk '{print $8}')
  pkill --signal 9 $process
}

fzf-down() {
  ${pkgs.fzf}/bin/fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

# Calculator
calc() { echo "scale=5;$*" | ${pkgs.bc}/bin/bc -l; }

ge()
{
    $EDITOR "$(find -L $HOME/.config $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type f | ${pkgs.fzf}/bin/fzf --height 100% --preview 'pv {}')"
}

go()
{
    cd $(find -L $HOME/.config $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type d | ${pkgs.fzf}/bin/fzf)
    lf
}

msd() {
  sudo udisksctl unlock -b /dev/sda1
  sudo udisksctl mount -b /dev/dm-3
  cd /media/Vault
  ls -alF
}
'';
};

}
