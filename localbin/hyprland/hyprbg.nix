{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/hyprland/hyprbg" = {
  executable = true;
  text = ''
#!/usr/bin/env bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containg images>"
	exit 1
fi

# Edit bellow to control the images transition
#export SWWW_TRANSITION_FPS=30
export SWWW_TRANSITION_STEP=15

# This controls (in seconds) when to switch to the next image
INTERVAL=3600

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			${pkgs.swww}/bin/swww img "$img"
			#swww img --transition-type wipe --transition-angle 30 "$img"
			sleep $INTERVAL
		done
done
  '';
  };
};

}
