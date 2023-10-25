{ pkgs, config, ... }:

{

services.dunst = {
  enable = true;
  settings = {
    frame = {
      width = 0;
      color = "#212121";
    };
    urgency_low = {
      background = "#000000";
      foreground = "#ffffff";
      timeout = 5;
      icon = "~/.config/dunst/normal.png";
    };
    urgency_normal = {
      background = "#212121";
      foreground = "#ffffff";
      timeout = 5;
      icon = "~/.config/dunst/normal.png";
    };
     urgency_critical = {
      background = "#900000";
      foreground = "#000000";
      timeout = 0;
      icon = "~/.config/dunst/critical.png"; 
    };
    global = {
      format = "%a\n<b>%s</b>\n%b\n%p";
      geometry = "300x5-8+30";

      font = "Roboto 11";
      allow_markup = "yes";
      plain_text = "no";             # Treat message as plain text
      sort = "yes";                  # Sort messages by urgency
      indicate_hidden = "yes";       # Show how many messages are currently hidden (see geometry)
      alignment = "center";          # Align text left/center/right
      bounce_freq = 0;             # Frequency to bounce text back and forth if it is longer than the window width (conflicts with "word_wrap")
      show_age_threshold = 60;     # Show if message is older than x seconds (-1 to disable)
      word_wrap = "yes";             # Split notifications into multiple lines if they don't fit into geometry
      ignore_newline = "no";         # Ignore "\n"
      transparency = 10;           # The transparency of the window. 0 (opaque) to 100 (transparent) - requires compositing window manager (xcompmgr, compiz, compton, etc)
      shrink = "no";                 # Shrink window if it's smaller than the width (ignored if width is 0)
      monitor = 0;                 # Display notifications on the monitor indicated (0 is default)
      follow = "mouse";               # Follow mouse/keyboard/none
      show_indicators = "no";        # Display indicators for URLs (U) and actions (A)
      line_height = 0;             # The spacing between lines (forced to height of font at minimum)
      notification_height = 0;     # The height of the entire notification (forced to height of font height and padding at minimum)
      separator_height = 2;        # Space in pixels between two notifications
      padding = 8;                 # Padding between text and separator
      horizontal_padding = 8;      # Horizontal padding
      separator_color = "frame";     # Color for separator: auto/foreground/frame/X color
      icon_position = "left";        # Align icons left/right/off

      idle_threshold = 120;        # Don't remove messages if the user is idle (no mouse or keyboard input) for longer than idle_threshold seconds
      sticky_history = "yes";        # Make notifications remain until clicked on (yes) or timeout as normal (no) when recalled from history
      history_length = 20;         # Maximum amount of notifications kept in history

      icon_folders = "/usr/share/icons/hicolor/16x16";
      startup_notification = false;
    };
    shortcuts.history = "mod1+n";
  };
};

home.file={
    ".config/dunst/icons" = {
      source = ~/.config/home-manager/config/dunst/icons;
    };
  };


}