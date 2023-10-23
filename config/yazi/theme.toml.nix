{ pkgs, config, ... }:

{

home.file = {
  ".config/yazi/theme.toml".text = ''
# vim:fileencoding=utf-8:foldmethod=marker

# : Manager {{{

[manager]
cwd = { fg = "cyan" }

# Hovered
hovered         = { fg = "black", bg = "lightblue" }
preview_hovered = { underline = true }

# Find
find_keyword  = { fg = "yellow", italic = true }
find_position = { fg = "magenta", bg = "reset", italic = true }

# Marker
marker_selected = { fg = "lightgreen",  bg = "lightgreen" }
marker_copied   = { fg = "lightyellow", bg = "lightyellow" }
marker_cut      = { fg = "lightred",    bg = "lightred" }

# Tab
tab_active   = { fg = "black", bg = "lightblue" }
tab_inactive = { fg = "white", bg = "darkgray" }
tab_width    = 1

# Border
border_symbol = " "
border_style  = { fg = "darkgray" }

# Offset
folder_offset  = [ 1, 0, 1, 0 ]
preview_offset = [ 1, 1, 1, 1 ]

# Highlighting
syntect_theme = ""

# : }}}


# : Status {{{

[status]
separator_open  = ""
separator_close = ""
separator_style = { fg = "darkgray", bg = "darkgray" }

# Mode
mode_normal = { fg = "black", bg = "lightblue", bold = true }
mode_select = { fg = "black", bg = "lightgreen", bold = true }
mode_unset  = { fg = "black", bg = "lightmagenta", bold = true }

# Progress
progress_label  = { bold = true }
progress_normal = { fg = "blue", bg = "black" }
progress_error  = { fg = "red", bg = "black" }

# Permissions
permissions_t = { fg = "lightgreen" }
permissions_r = { fg = "lightyellow" }
permissions_w = { fg = "lightred" }
permissions_x = { fg = "lightcyan" }
permissions_s = { fg = "darkgray" }

# : }}}


# : Input {{{

[input]
border   = { fg = "blue" }
title    = {}
value    = {}
selected = { reversed = true }

# : }}}


# : Select {{{

[select]
border   = { fg = "blue" }
active   = { fg = "magenta" }
inactive = {}

# : }}}


# : Tasks {{{

[tasks]
border  = { fg = "blue" }
title   = {}
hovered = { underline = true }

# : }}}


# : Which {{{

[which]
mask            = { bg = "reset" }
cand            = { fg = "lightcyan" }
rest            = { fg = "darkgray" }
desc            = { fg = "magenta" }
separator       = "  "
separator_style = { fg = "darkgray" }

# : }}}


# : Help {{{

[help]
on      = { fg = "magenta" }
exec    = { fg = "cyan" }
desc    = { fg = "gray" }
hovered = { bg = "darkgray", bold = true }
footer  = { fg = "black", bg = "white" }

# : }}}


# : File-specific styles {{{

[filetype]

rules = [
	# Images
	{ mime = "image/*", fg = "cyan" },

	# Videos
	{ mime = "video/*", fg = "red" },
	{ mime = "audio/*", fg = "red" },

	# Archives
	{ mime = "application/zip",             fg = "magenta" },
	{ mime = "application/gzip",            fg = "magenta" },
	{ mime = "application/x-tar",           fg = "magenta" },
	{ mime = "application/x-bzip",          fg = "magenta" },
	{ mime = "application/x-bzip2",         fg = "magenta" },
	{ mime = "application/x-7z-compressed", fg = "magenta" },
	{ mime = "application/x-rar",           fg = "magenta" },

	{ mime = "inode/symlink", bg = "cyan" },
	# Fallback
	# { name = "*", fg = "white" },
	{ name = "*/", fg = "blue" }
]

[icons]

"Desktop/"     = ""
"Documents/"   = ""
"Downloads/"   = ""
"Pictures/"    = ""
"Music/"       = ""
"Movies/"      = ""
"Videos/"      = ""
"Public/"      = ""
"Library/"     = ""
"Development/" = ""
".config/"     = ""

# Git
".git/"          = ""
".gitignore"     = ""
".gitmodules"    = ""
".gitattributes" = ""

# Dotfiles
".DS_Store"    = ""
".bashrc"      = ""
".bashprofile" = ""
".zshrc"       = ""
".zshenv"      = ""
".zprofile"    = ""
".vimrc"       = ""

# Text
"*.txt" = ""
"*.md"  = ""

# Archives
"*.zip" = ""
"*.tar" = ""
"*.gz"  = ""
"*.7z"  = ""

# Audio
"*.mp3"  = ""
"*.flac" = ""
"*.wav"  = ""

# Movies
"*.mp4" = ""
"*.mkv" = ""
"*.avi" = ""
"*.mov" = ""

# Images
"*.jpg"  = ""
"*.jpeg" = ""
"*.png"  = ""
"*.gif"  = ""
"*.webp" = ""
"*.avif" = ""
"*.bmp"  = ""
"*.ico"  = ""
"*.svg"  = ""

# Programming
"*.c"     = ""
"*.cpp"   = ""
"*.h"     = ""
"*.hpp"   = ""
"*.rs"    = ""
"*.go"    = ""
"*.py"    = ""
"*.js"    = ""
"*.ts"    = ""
"*.tsx"   = ""
"*.jsx"   = ""
"*.rb"    = ""
"*.php"   = ""
"*.java"  = ""
"*.sh"    = ""
"*.fish"  = ""
"*.swift" = ""
"*.vim"   = ""
"*.lua"   = ""
"*.html"  = ""
"*.css"   = ""
"*.scss"  = ""
"*.json"  = ""
"*.toml"  = ""
"*.yml"   = ""
"*.yaml"  = ""
"*.ini"   = ""
"*.conf"  = ""

# Default
"*"  = ""
"*/" = ""

# : }}}
'';
};

}
