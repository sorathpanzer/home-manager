{ pkgs, config, ... }:

{

  home.file = {
  ".config/yazi/keymap.toml".text = ''
    [manager]

    keymap = [
    { on = [ "z", "l" ],        exec = [
    "shell --block --confirm 'sudo zpool import -lf -R /run/media/sorath Legion'",
    "cd /run/media/sorath/Legion", 
    ],  desc = "Open Legion Zfs" },

    { on = [ "z", "k" ],        exec = [
    "shell --block --confirm 'zpool import -lf -R /run/media/sorath Krampus'",
    "cd /run/media/sorath/Krampus",
    ],  desc = "Open Krampus Zfs" },

    { on = [ "<", "z" ],        exec = [
    "shell --block --confirm '${pkgs.helix}/bin/hx $(find -L $HOME/.config/ $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type f | ${pkgs.fzf}/bin/fzf --height 100%)'",
    ],  desc = "Edit/Navigate to File" },

    { on = [ "X" ],        exec = [
    "shell --block --confirm 'backit=$(dirname \"$1\"); link=$(dirname \"$1\" | cut -d '/' -f4); file=$(basename \"$1\"); mv \"$1\" ~/.config/dotgit/dotfiles/$link; cd ~/.config/dotgit; ${pkgs.stow}/bin/stow -nvt ~ dotfiles; read'",
    "shell --block --confirm 'backit=$(dirname \"$1\"); link=$(dirname \"$1\" | cut -d '/' -f4); file=$(basename \"$1\"); mv \"$1\" ~/.config/dotgit/dotfiles/$link; cd ~/.config/dotgit; ${pkgs.stow}/bin/stow -vt ~ dotfiles'",
    ],  desc = "Stow a file or folder" },

    { on = [ "c", "p" ], exec = [ 
    "shell --block --confirm '${pkgs.dunst}/bin/dunstify -t 1000 \"Path copied\"'", 
    "copy path"
    ], desc = "Copy the absolute path" },

    { on = [ "c", "d" ], exec = [ 
    "shell --block --confirm '${pkgs.dunst}/bin/dunstify -t 1000 \"Parent path copied\"'", 
    "copy dirname"
    ], desc = "Copy the parent path" },

    { on = [ "c", "f" ], exec = [ 
    "shell --block --confirm '${pkgs.dunst}/bin/dunstify -t 1000 \"Name of the file copied\"'", 
    "copy filename"
    ], desc = "Copy the name of the file" },

    { on = [ "c", "n" ], exec = [ 
    "shell --block --confirm '${pkgs.dunst}/bin/dunstify -t 1000 \"Name of the file -ext copied\"'", 
    "copy name_without_ext"
    ], desc = "Copy the name of the file without ext" },

    { on = [ "*" ],             exec = "shell --block --confirm 'chmod +x $1'",  desc = "chmod file" },
    { on = [ "º" ],             exec = "shell --block --confirm '${pkgs.btop}/bin/btop'",  desc = "View size with Dua" },
    { on = [ "b", "g" ],        exec = "shell --block --confirm '${pkgs.swww}/bin/swww img $1'",  desc = "Set background" },
    { on = [ "d", "d" ],        exec = "shell --block --confirm '${pkgs.trash-cli}/bin/trash-put \"$@\"'", desc = "Move the files to the trash" },
    { on = [ "D" ],         exec = [ "remove --permanently", "escape --visual --select" ], desc = "Permanently delete the files" },
    { on = [ "d", "r" ],        exec = "shell --block --confirm '${pkgs.trash-cli}/bin/trash-restore'", desc = "Restore files from trash" },
    { on = [ "d", "c" ],        exec = "shell --block --confirm '${pkgs.trash-cli}/bin/trash-empty -f; paplay ~/.sounds/trash-empty.ogg'", desc = "Clean files from trash" },

    { on = [ "z", "n" ],        exec = [
    "shell --block --confirm 'mount /media/Bunker/Vault; mount /media/Bunker/Crypta'",
    "cd /media/Bunker", ],     desc = "Mount NFS" },

    { on = [ "<Esc>" ], exec = "escape",  desc = "Exit visual mode, clear selected, or cancel search" },
    { on = [ "w" ],     exec = "quit --no-cwd-file",    desc = "Exit the process" },
    { on = [ "q" ],     exec = "quit",    desc = "Exit the process" },
    { on = [ "<C-q>" ], exec = "close",   desc = "Close the current tab, or quit if it is last tab" },
    { on = [ "<C-z>" ], exec = "suspend", desc = "Suspend the process" },

    # Navigation
    { on = [ "k" ], exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "j" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "K" ], exec = "arrow -5", desc = "Move cursor up 5 lines" },
    { on = [ "J" ], exec = "arrow 5",  desc = "Move cursor down 5 lines" },

    { on = [ "h" ], exec = "leave", desc = "Go back to the parent directory" },
    { on = [ "l" ], exec = "enter", desc = "Enter the child directory" },

    { on = [ "<C-Left>" ], exec = "back",    desc = "Go back to the previous directory" },
    { on = [ "<C-Right>" ], exec = "forward", desc = "Go forward to the next directory" },
    { on = [ "<C-Down>" ], exec = "back",    desc = "Go back to the previous directory" },
    { on = [ "<C-Up>" ], exec = "forward", desc = "Go forward to the next directory" },

    { on = [ "<C-k>" ], exec = "peek -5", desc = "Peek up 5 units in the preview" },
    { on = [ "<C-j>" ], exec = "peek 5",  desc = "Peek down 5 units in the preview" },

    { on = [ "<Up>" ],    exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "<Down>" ],  exec = "arrow 1",  desc = "Move cursor down" },
    { on = [ "<Left>" ],  exec = "leave",    desc = "Go back to the parent directory" },
    { on = [ "<Right>" ], exec = [ "enter" ],    desc = "Enter the child directory" },

    { on = [ "g", "g" ], exec = "arrow -99999999", desc = "Move cursor to the top" },
    { on = [ "G" ],      exec = "arrow 99999999",  desc = "Move cursor to the bottom" },

    # Selection
    { on = [ "<Space>" ], exec = [ "select --state=none", "arrow 1" ], desc = "Toggle the current selection state" },
    { on = [ "v" ],       exec = "visual_mode",                        desc = "Enter visual mode (selection mode)" },
    { on = [ "V" ],       exec = "visual_mode --unset",                desc = "Enter visual mode (unset mode)" },
    { on = [ "<C-a>" ],   exec = "select_all --state=true",            desc = "Select all files" },
    { on = [ "<C-Space>" ],   exec = "select_all --state=none",            desc = "Inverse selection of all files" },

    # Operation
    { on = [ "o" ],         exec = "open",                   desc = "Open the selected files" },
    { on = [ "O" ],         exec = "open --interactive",     desc = "Open the selected files interactively" },
    { on = [ "<Enter>" ],   exec = "open",                   desc = "Open the selected files" },
    { on = [ "<Enter>" ],   exec = "open",                   desc = "Open the selected files" },
    { on = [ "<C-Enter>" ], exec = "open --interactive",     desc = "Open the selected files interactively" },  # It's cool if you're using a terminal that supports CSI u
    { on = [ "y" ],         exec = "yank",                   desc = "Copy the selected files" },
    { on = [ "x" ],         exec = "yank --cut",             desc = "Cut the selected files" },
    { on = [ "p" ],         exec = "paste",                  desc = "Paste the files" },
    { on = [ "P" ],         exec = "paste --force",          desc = "Paste the files (overwrite if the destination exists)" },
    { on = [ "k" ],         exec = "paste --follow",         desc = "Paste the files (follow the symlinks)" },
    { on = [ "K" ],         exec = "paste --follow --force", desc = "Paste the files (overwrite + follow)" },
    # { on = [ "D" ],         exec = "remove --permanently",   desc = "Permanently delete the files" },
    { on = [ "a" ],         exec = "create",                 desc = "Create a file or directory (ends with / for directories)" },
    { on = [ "r" ],         exec = "rename",                 desc = "Rename a file or directory" },
    { on = [ ";" ],         exec = "shell",                  desc = "Run a shell command" },
    { on = [ ":" ],         exec = "shell --block",          desc = "Run a shell command (block the UI until the command finishes)" },
    { on = [ "." ],         exec = "hidden toggle",          desc = "Toggle the visibility of hidden files" },
    { on = [ "s" ],         exec = "search fd",              desc = "Search files by name using fd" },
    { on = [ "S" ],         exec = "search rg --no-hidden",              desc = "Search files by content using ripgrep" },
    { on = [ "<C-s>" ],     exec = "search none",            desc = "Cancel the ongoing search" },
    { on = [ "z" ],         exec = "jump zoxide",            desc = "Jump to a directory using zoxide" },
    { on = [ "<", "<" ],    exec = "jump fzf",               desc = "Jump to a directory, or reveal a file using fzf" },

    # Linemode
    { on = [ "m", "s" ], exec = "linemode size",        desc = "Set linemode to size" },
    { on = [ "m", "p" ], exec = "linemode permissions", desc = "Set linemode to permissions" },
    { on = [ "m", "m" ], exec = "linemode mtime",       desc = "Set linemode to mtime" },
    { on = [ "m", "n" ], exec = "linemode none",        desc = "Set linemode to none" },

    # Find
    { on = [ "/" ], exec = "find" },
    { on = [ "?" ], exec = "find --previous" },
    { on = [ "n" ], exec = "find_arrow" },
    { on = [ "N" ], exec = "find_arrow --previous" },
    { on = [ "-" ],         exec = "link",                   desc = "Symlink the absolute path of files" },
    { on = [ "_" ],         exec = "link --relative",        desc = "Symlink the relative path of files" },

    # Sorting
    { on = [ ",", "a" ], exec = "sort alphabetical --dir_first",           desc = "Sort alphabetically, directories first" },
    { on = [ ",", "A" ], exec = "sort alphabetical --reverse --dir_first", desc = "Sort alphabetically, directories first (reverse)" },
    { on = [ ",", "c" ], exec = "sort created --dir_first",                desc = "Sort by creation time, directories first" },
    { on = [ ",", "C" ], exec = "sort created --reverse --dir_first",      desc = "Sort by creation time, directories first (reverse)" },
    { on = [ ",", "m" ], exec = "sort modified --dir_first",               desc = "Sort by modified time, directories first" },
    { on = [ ",", "M" ], exec = "sort modified --reverse --dir_first",     desc = "Sort by modified time, directories first (reverse)" },
    { on = [ ",", "n" ], exec = "sort natural --dir_first",                desc = "Sort naturally, directories first" },
    { on = [ ",", "N" ], exec = "sort natural --reverse --dir_first",      desc = "Sort naturally, directories first (reverse)" },
    { on = [ ",", "s" ], exec = "sort size --dir_first",                   desc = "Sort by size, directories first" },
    { on = [ ",", "S" ], exec = "sort size --reverse --dir_first",         desc = "Sort by size, directories first (reverse)" },

    # Tabs
    { on = [ "t" ], exec = "tab_create --current", desc = "Create a new tab using the current path" },

    { on = [ "1" ], exec = "tab_switch 0", desc = "Switch to the first tab" },
    { on = [ "2" ], exec = "tab_switch 1", desc = "Switch to the second tab" },
    { on = [ "3" ], exec = "tab_switch 2", desc = "Switch to the third tab" },
    { on = [ "4" ], exec = "tab_switch 3", desc = "Switch to the fourth tab" },
    { on = [ "5" ], exec = "tab_switch 4", desc = "Switch to the fifth tab" },
    { on = [ "6" ], exec = "tab_switch 5", desc = "Switch to the sixth tab" },
    { on = [ "7" ], exec = "tab_switch 6", desc = "Switch to the seventh tab" },
    { on = [ "8" ], exec = "tab_switch 7", desc = "Switch to the eighth tab" },
    { on = [ "9" ], exec = "tab_switch 8", desc = "Switch to the ninth tab" },

    { on = [ "[" ], exec = "tab_switch -1 --relative", desc = "Switch to the previous tab" },
    { on = [ "]" ], exec = "tab_switch 1 --relative",  desc = "Switch to the next tab" },

    { on = [ "{" ], exec = "tab_swap -1", desc = "Swap the current tab with the previous tab" },
    { on = [ "}" ], exec = "tab_swap 1",  desc = "Swap the current tab with the next tab" },

    # Tasks
    { on = [ "T" ], exec = "tasks_show", desc = "Show the tasks manager" },

    # Goto
    { on = [ "g", "h" ],       exec = "cd ~",                       desc = "Go to the home directory" },
    { on = [ "g", "c" ],       exec = "cd ~/.config",               desc = "Go to the config directory" },
    { on = [ "g", "." ],       exec = "cd ~/.config/home-manager",               desc = "Go to the config directory" },
    { on = [ "g", "l" ],       exec = "cd ~/.local",                desc = "Go to the local directory" },
    { on = [ "g", "d" ],       exec = "cd ~/Documentos",            desc = "Go to the Documentos directory" },
    { on = [ "g", "i" ],       exec = "cd ~/Imagens",               desc = "Go to the Imagens directory" },
    { on = [ "g", "v" ],       exec = "cd ~/Vídeos",                desc = "Go to the Vídeos directory" },
    { on = [ "g", "t" ],       exec = "cd ~/Transferências",         desc = "Go to the Transferências directory" },
    { on = [ "g", "L" ],       exec = "cd /run/media/sorath/Legion",  desc = "Go to Legion" },
    { on = [ "g", "M" ],       exec = "cd /run/media/sorath",  desc = "Go to Legion" },
    { on = [ "g", "<Space>" ], exec = "cd --interactive",           desc = "Go to a directory interactively" },

    # Help
    { on = [ "~" ], exec = "help", desc = "Open help" },
    ]

    [tasks]

    keymap = [
    { on = [ "<Esc>" ], exec = "close", desc = "Hide the task manager" },
    { on = [ "<C-q>" ], exec = "close", desc = "Hide the task manager" },
    { on = [ "w" ],     exec = "close", desc = "Hide the task manager" },

    { on = [ "k" ], exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "j" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "<Up>" ],   exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "<Down>" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "<Enter>" ], exec = "inspect", desc = "Inspect the task" },
    { on = [ "x" ],       exec = "cancel",  desc = "Cancel the task" },

    { on = [ "~" ], exec = "help", desc = "Open help" }
    ]

    [select]

    keymap = [
    { on = [ "<C-q>" ],   exec = "close",          desc = "Cancel selection" },
    { on = [ "<Esc>" ],   exec = "close",          desc = "Cancel selection" },
    { on = [ "<Enter>" ], exec = "close --submit", desc = "Submit the selection" },

    { on = [ "k" ], exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "j" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "K" ], exec = "arrow -5", desc = "Move cursor up 5 lines" },
    { on = [ "J" ], exec = "arrow 5",  desc = "Move cursor down 5 lines" },

    { on = [ "<Up>" ],   exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "<Down>" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "~" ], exec = "help", desc = "Open help" }
    ]

    [input]

    keymap = [
    { on = [ "<C-q>" ],       exec = "close",          desc = "Cancel input" },
    { on = [ "<Enter>" ],     exec = "close --submit", desc = "Submit the input" },
    { on = [ "<Esc>" ],       exec = "escape",         desc = "Go back the normal mode, or cancel input" },

    # Mode
    { on = [ "i" ], exec = "insert",                              desc = "Enter insert mode" },
    { on = [ "a" ], exec = "insert --append",                     desc = "Enter append mode" },
    { on = [ "v" ], exec = "visual",                              desc = "Enter visual mode" },
    { on = [ "V" ], exec = [ "move -999", "visual", "move 999" ], desc = "Enter visual mode and select all" },

    # Navigation
    { on = [ "h" ], exec = "move -1", desc = "Move cursor left" },
    { on = [ "l" ], exec = "move 1",  desc = "Move cursor right" },

    { on = [ "0" ], exec = "move -999",                       desc = "Move to the BOL" },
    { on = [ "$" ], exec = "move 999",                        desc = "Move to the EOL" },
    { on = [ "I" ], exec = [ "move -999", "insert" ],         desc = "Move to the BOL, and enter insert mode" },
    { on = [ "A" ], exec = [ "move 999", "insert --append" ], desc = "Move to the EOL, and enter append mode" },

    { on = [ "<Left>" ],  exec = "move -1", desc = "Move cursor left" },
    { on = [ "<Right>" ], exec = "move 1",  desc = "Move cursor right" },

    { on = [ "b" ], exec = "backward",              desc = "Move to the beginning of the previous word" },
    { on = [ "w" ], exec = "forward",               desc = "Move to the beginning of the next word" },
    { on = [ "e" ], exec = "forward --end-of-word", desc = "Move to the end of the next word" },

    # Deletion
    { on = [ "d" ], exec = "delete --cut",                              desc = "Cut the selected characters" },
    { on = [ "D" ], exec = [ "delete --cut", "move 999" ],              desc = "Cut until the EOL" },
    { on = [ "c" ], exec = "delete --cut --insert",                     desc = "Cut the selected characters, and enter insert mode" },
    { on = [ "C" ], exec = [ "delete --cut --insert", "move 999" ],     desc = "Cut until the EOL, and enter insert mode" },
    { on = [ "x" ], exec = [ "delete --cut", "move 1 --in-operating" ], desc = "Cut the current character" },

    # Yank/Paste
    { on = [ "y" ], exec = "yank",           desc = "Copy the selected characters" },
    { on = [ "p" ], exec = "paste",          desc = "Paste the copied characters after the cursor" },
    { on = [ "P" ], exec = "paste --before", desc = "Paste the copied characters before the cursor" },

    # Undo/Redo
    { on = [ "u" ],     exec = "undo", desc = "Undo the last operation" },
    { on = [ "<C-r>" ], exec = "redo", desc = "Redo the last operation" },

    # Help
    { on = [ "~" ], exec = "help", desc = "Open help" }
    ]

    [help]

    keymap = [
    { on = [ "<Esc>" ], exec = "escape", desc = "Clear the filter, or hide the help" },
    { on = [ "q" ],     exec = "close",  desc = "Exit the process" },
    { on = [ "<C-q>" ], exec = "close",  desc = "Hide the help" },

    # Navigation
    { on = [ "k" ], exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "j" ], exec = "arrow 1",  desc = "Move cursor down" },

    { on = [ "K" ], exec = "arrow -5", desc = "Move cursor up 5 lines" },
    { on = [ "J" ], exec = "arrow 5",  desc = "Move cursor down 5 lines" },

    { on = [ "<Up>" ],   exec = "arrow -1", desc = "Move cursor up" },
    { on = [ "<Down>" ], exec = "arrow 1",  desc = "Move cursor down" },

    # Filtering
    { on = [ "/" ], exec = "filter", desc = "Apply a filter for the help items" },
    ]
    '';
  };

}
