{ pkgs, config, ... }:

{

home.file = {
  ".config/tofi/config".text = ''
width = 100%
height = 100%
font-size = 24
font = UbuntuMono Nerd Font
prompt-text = ""
outline-width = 0
border-width = 0
background-color = #00000099
selection-color = #268bd2
result-spacing = 5
padding-top = 290
padding-left = 885
hint-font = false
'';
  ".config/tofi/config-top".text = ''
anchor = top
width = 100%
height = 12%
horizontal = false
font-size = 12
font = UbuntuMono Nerd Font
prompt-text = ""
outline-width = 0
border-width = 0
background-color = #00000090
selection-color = #268bd2
selection-background = #444
num-results = 10
min-input-width = 240
result-spacing = 10
padding-top = 0
padding-bottom = 0
padding-left = 700
padding-right = 0
hint-font = false
history = true
history-file = ~/.cache/history
'';
  ".config/tofi/assets/appmenu".text = ''
  calibre
  fragments
  libreoffice
  logseq
  metatrader
  popcorntime
  signal-desktop
  steam
  Wapp
'';
};

}
