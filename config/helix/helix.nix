{ pkgs, config, ... }:

let
user-scripts = pkgs.stdenv.mkDerivation rec{
  pname = "user-scripts";
  version = "1.0";
  src = ./snippets;
  phases = "installPhase fixupPhase";
  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/* $out/bin
    chmod +x $out/bin/*
  '';
  };
in

{

home.packages = [
  user-scripts
];

programs.helix = {
  enable = true;
  themes = {
  doomnight = let
    in {
    inherits = "tokyonight";

    "variable.other.member" = { fg = "#AE92E3"; modifiers = ["bold"]; };
    "ui.background" = { fg = "foreground"; bg = "transparent"; };
    "ui.cursorline.primary" = { bg = "background_highlight"; };
    "ui.cursor.primary" = { bg = "#AE92E3"; fg = "background_highlight"; };
    "ui.menu" = { fg = "foreground"; bg = "transparent"; };
    "ui.selection.primary" = { bg = "#46506d"; };
    "ui.statusline.inactive" = { fg = "#737ba5"; bg = "background_menu"; };
    "ui.help" = { fg = "foreground"; bg = "transparent"; };
    "ui.popup" = { fg = "foreground"; bg = "transparent"; };
    };
  };
  settings = {
    theme = "doomnight";
    editor = {
      cursorline = true;
      auto-format = true;
      bufferline = "multiple";
    };
    editor.cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    editor.statusline = {
      left = ["mode" "spinner"];
      center = ["file-name"];
      right = ["diagnostics" "version-control" "position" "total-line-numbers" "file-type"];
      separator = "│";
      mode.normal = "NORMAL";
      mode.insert = "INSERT";
      mode.select = "SELECT";
    };
    editor.indent-guides = {
      render = true;
      character = "╎"; # Some characters that work well: "▏", "┆", "┊", "⸽"
      skip-levels = 1;
    };
    editor.lsp = {
      display-messages = true;
    };
    keys.normal = {
      del = "delete_selection";
      d = [":clipboard-yank" "delete_selection"];
      A-a = "select_all";
      A-e = ["extend_to_line_bounds" "select_mode" "goto_last_line"];
      A-g = ["extend_to_line_bounds" "select_mode" "goto_file_start"];
      A-x = ["move_next_word_end" "move_prev_word_start"];
      "!" = "paste_after";
      X = ["move_next_long_word_end" "move_prev_long_word_start"];
      esc = ["collapse_selection" "keep_primary_selection"];
      y = [":clipboard-yank" "yank"];
      k = "replay_macro";
      K = "record_macro";
      q = ":buffer-close";
      Q = ":buffer-close!";
      C-q = ":q!";
      C-w = ":wq";
      p = ["move_visual_line_down" ":clipboard-paste-before"];
      F1 = "goto_line_start";
      F2 = "goto_line_end";
      ">" = "goto_previous_buffer";
      "<" = "goto_next_buffer";
      S-esc = ["select_all" "delete_selection"];
      x = ["extend_to_line_bounds" "select_mode"];
      A-c = ["move_next_word_end" "move_prev_word_start" "change_selection"];
      C = ["move_next_long_word_end" "move_prev_long_word_start" "change_selection"];
      A-down = "jump_forward";
      A-up = "jump_backward";
      "º" = "save_selection";
      C-down = "copy_selection_on_next_line";
      C-up = "copy_selection_on_prev_line";
    };
    keys.select = {
      y = [":clipboard-yank" "yank" "collapse_selection" "normal_mode"];
      esc = ["collapse_selection" "normal_mode"];
      d = [":clipboard-yank" "delete_selection"];
      k = "replay_macro";
      K = "record_macro";
      F1 = "goto_line_start";
      F2 = "goto_line_end";
      C-down = "copy_selection_on_next_line";
      C-up = "copy_selection_on_prev_line";
    };
    keys.select."space" = { 
      g = "goto_last_line";  
    };
    keys.select."+" = {
      "+" = "toggle_comments";
    };
    keys.normal."+" = {
      "+" = "toggle_comments";
    };
    keys.normal.h = {
      d = [":insert-output date" "collapse_selection" "insert_at_line_end"];
      h = [":append-output ~/.nix-profile/bin/home-manager-homefile" "collapse_selection" "insert_at_line_end"];
      p = [":append-output ~/.nix-profile/bin/home-manager-programs" "collapse_selection" "insert_at_line_end"];
    };
    keys.normal."space" = {
      y = ["extend_line_below" ":clipboard-yank"];
      d = ["extend_line_below" "delete_selection"] ;
      x = ["move_next_long_word_end" "move_prev_long_word_start"];
      space = "file_picker";
      g = "goto_last_line";
      w = ":wq";
    };
    keys.insert = {
      C-s = "kill_to_line_start";
    };
  };
};

home.file = {
  ".config/helix/languages.toml".text = ''
    [[language]]
    name = "bash"
    language-server = { command = "${pkgs.nodePackages.bash-language-server}/bin/bash-language-server", args = ["start"] }
'';
};

}