{ pkgs, config, ... }:

{

home.file.".sounds/camera-shutter.ogg".source = config.lib.file.mkOutOfStoreSymlink ./localbin/assets/camera-shutter.ogg;
home.file.".sounds/trash-empty.ogg".source = config.lib.file.mkOutOfStoreSymlink ./localbin/assets/trash-empty.ogg;
home.file.".local/share/fonts/NotoEmojiNerdFontComplete.ttf".source = config.lib.file.mkOutOfStoreSymlink ./localbin/assets/NotoEmojiNerdFontComplete.ttf;

}
