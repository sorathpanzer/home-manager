{ pkgs, config, ... }:

{

# programs.imv.enable = true;

home.file = {
  ".config/imv/config".text = ''
[options]

suppress_default_binds = true

[binds]

# Image navigation
<Left> = prev
<Right> = next
gg = goto 1
<Shift+G> = goto -1

# Panning
<Ctrl+Up> = pan 0 25
<Ctrl+Down> = pan 0 -25
<Ctrl+Right> = pan -25 0
<Ctrl+Left> = pan 25 0

<plus> = zoom 1
<Up> = zoom 1
<minus> = zoom -1
<Down> = zoom -1
a = zoom actual

# Rotate Clockwise by 90 degrees
<less> = rotate by 90
<greater> = rotate by -90

# Other commands
x = close
f = fullscreen
v = overlay
p = exec echo $imv_current_file
w = center
s = scaling next
<Shift+S> = upscaling next
r = reset
<backslash> = flip horizontal

# Gif playback
<period> = next_frame
<space> = toggle_playing

# Slideshow control
t = slideshow +1
<Shift+T> = slideshow -1

q = exec imvclose
bg = exec wal -qi "$imv_current_file"
dd = exec ${pkgs.trash-cli}/bin/trash-put "$imv_current_file"
y = exec cp $imv_current_file ~/Imagens/x
'';
};

}
