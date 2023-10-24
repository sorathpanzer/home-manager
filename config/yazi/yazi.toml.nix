{ pkgs, config, ... }:

{

home.file = {
  ".config/yazi/yazi.toml".text = ''
[manager]
layout         = [ 1, 5, 5 ]
sort_by        = "alphabetical"
sort_sensitive = false
sort_reverse   = false
sort_dir_first = true
linemode       = "none"
show_hidden    = false
show_symlink   = true

[preview]
tab_size   = 2
max_width  = 1200
max_height = 1800
cache_dir  = ""

[opener]
edit = [
	{ exec = '$EDITOR "$@"', block = true,  for = "unix" },
	{ exec = 'code "%*"',    orphan = true, for = "windows" },
]
open = [
	{ exec = 'xdg-open "$@"',             desc = "Open", for = "linux" },
	{ exec = 'open "$@"',                 desc = "Open", for = "macos" },
	{ exec = 'start "%1"', orphan = true, desc = "Open", for = "windows" }
]
img = [
	{ exec = 'hyprimv "$@"',             desc = "Open", for = "linux" },
]
reveal = [
	{ exec = 'open -R "$1"',                       desc = "Reveal", for = "macos" },
	{ exec = 'explorer /select,%1', orphan = true, desc = "Reveal", for = "windows" },
	{ exec = '${pkgs.exiftool}/bin/exiftool "$1"; echo "Press enter to exit"; read', block = true, desc = "Show EXIF", for = "unix" },
]
extract = [
	{ exec = '${pkgs.unar}/bin/unar "$1"', desc = "Extract here", for = "unix" },
	{ exec = '${pkgs.unar}/bin/unar "%1"', desc = "Extract here", for = "windows" },
]
play = [
	{ exec = '${pkgs.mpv}/bin/mpv --loop "$@"', orphan = true, for = "unix" },
	{ exec = '${pkgs.mpv}/bin/mpv --loop "%1"', orphan = true, for = "windows" },
	{ exec = '${pkgs.mediainfo}/bin/mediainfo "$1"; echo "Press enter to exit"; read', block = true, desc = "Show media info", for = "unix" },
]

[open]
rules = [
	{ name = "*/", use = [ "edit", "open", "reveal" ] },

	{ mime = "text/*",  use = [ "edit", "reveal" ] },
	{ mime = "image/*", use = [ "img", "reveal" ] },
	{ mime = "video/*", use = [ "play", "reveal" ] },
	{ mime = "audio/*", use = [ "play", "reveal" ] },
	{ mime = "inode/x-empty", use = [ "edit", "reveal" ] },

	{ mime = "application/json", use = [ "edit", "reveal" ] },
	{ mime = "*/javascript",     use = [ "edit", "reveal" ] },

	{ mime = "application/zip",             use = [ "extract", "reveal" ] },
	{ mime = "application/gzip",            use = [ "extract", "reveal" ] },
	{ mime = "application/x-tar",           use = [ "extract", "reveal" ] },
	{ mime = "application/x-bzip",          use = [ "extract", "reveal" ] },
	{ mime = "application/x-bzip2",         use = [ "extract", "reveal" ] },
	{ mime = "application/x-7z-compressed", use = [ "extract", "reveal" ] },
	{ mime = "application/x-rar",           use = [ "extract", "reveal" ] },

	{ mime = "*", use = [ "open", "reveal" ] },
]

[tasks]
micro_workers = 3
macro_workers = 5
bizarre_retry = 5

[log]
enabled = false
'';
};

}
