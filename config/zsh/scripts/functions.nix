{ pkgs, config, ... }:

{

home.file = {
  ".config/zsh/scripts/functions".text = ''
#!/usr/bin/env bash

nx-config() {
import()
{
  FILE=$(ls ~/Documentos/nixos | fzf)
  cat ~/Documentos/nixos/$FILE | sudo tee /etc/nixos/configuration.nix
}

export()
{
  cat /etc/nixos/configuration.nix | tee ~/Documentos/nixos/$(ls ~/Documentos/nixos | fzf)
}

case "''${1}" in
  "") sudo -E nvim /etc/nixos/configuration.nix ;;
  in) import ;;
  ex) export ;;
esac
}

pmos() {
  pmbootstrap shutdown
  pmbootstrap zap -p
  pmbootstrap init
  pmbootstrap install --android-recovery-zip
  pmbootstrap flasher --method=adb sideload
}

twrp() {
  sudo adb reboot bootloader
  sudo fastboot flash recovery $HOME/Transferências/Mobile/twrp.img
  sudo fastboot reboot
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
  yt-dlp -x --audio-format mp3 "$(wl-paste)"
}

mp4()
{
  yt-dlp "$(wl-paste)"
}

mpl()
{
  mpv "$(wl-paste)"
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
  sudo fwupdmgr refresh --force
  sudo fwupdmgr get-updates
  sudo fwupdmgr update
}

vscan() {
  echo "Procurar actualizações"
  freshclam
  echo "Procurar malwares..."
  clamscan -r --bell -i -o $HOME
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
  fzf --height 50% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

# Calculator
calc() { echo "scale=5;$*" | bc -l; }

ge()
{
    $EDITOR "$(find -L $HOME/.config $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type f | fzf --height 100% --preview 'pv {}')"
}

go()
{
    cd $(find -L $HOME/.config $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type d | fzf)
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
