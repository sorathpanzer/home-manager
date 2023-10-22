{ pkgs, config, ... }:

{
  
  programs.mpv = {
    enable = true;
    config = {
      sub-auto = "all";
      osc = "no";
      profile = "gpu-hq";
      hwdec = "auto-safe";
      vo = "gpu";
      gpu-context = "wayland";
    };
    bindings = {
      "<" = "no-osd cycle-values video-rotate  90 180 270 0";
      ">" = "no-osd cycle-values video-rotate  270 180 90 0";
      
      "Alt+LEFT" = "add video-pan-x -0.02";
      "Alt+RIGHT" = "add video-pan-x 0.02";
      "Alt+DOWN" = "add video-pan-y 0.02";
      "Alt+UP " =  "add video-pan-y -0.02";
      
      "q" = "run hyprmpv";
      DOWN = "playlist-prev";
      l = "cycle-values loop-file inf no";
      d = ''run "${pkgs.trash-cli}/bin/trash-put" "''${path}"; playlist_next; show-text "Deleted ''${path}"'';
      y = ''run sh -c "cp \"''${path}\" ~/Imagens/x"; show-text "Copied ''${path} to Imagens/x"'';
    };
  };

}