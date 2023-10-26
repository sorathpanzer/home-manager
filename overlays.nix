self: super:
let
  unstable = import <unstable> {};
in {
  yazi = unstable.yazi;
  hyprland = unstable.hyprland;
  waybar = unstable.waybar;
}