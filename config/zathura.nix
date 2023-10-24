{ pkgs, config, ... }:

{

programs.zathura = {
  enable = true;
  options = {
    completion-group-bg =        "#282828";
    completion-group-fg =        "#ebdbb2";
    completion-bg =              "#282828";
    completion-fg =              "#ebdbb2";
    completion-highlight-bg =    "#458588";
    completion-highlight-fg =    "#ebdbb2";
    notification-error-bg =      "#3c3836";
    notification-error-fg =      "#ebdbb2";
    notification-warning-bg =    "#3c3836";
    notification-warning-fg =    "#ebdbb2";
    notification-bg =            "#3c3836";
    notification-fg =            "#ebdbb2";
    index-bg =                   "#1d2021";
    index-fg =                   "#ebdbb2";
    index-active-bg =            "#282828";
    index-active-fg =            "#ebdbb2";
    inputbar-bg =                "#3c3836";
    inputbar-fg =                "#ebdbb2";
    statusbar-bg =               "#282828";
    statusbar-fg =               "#ebdbb2";
    highlight-color =            "#458588";
    highlight-active-color =     "#458588";
    default-bg =                 "#1d2021";
    default-fg =                 "#001512";
    recolor-lightcolor =         "#1d2021";
    recolor-darkcolor =          "#ebdbb2";
    recolor = true;
    guioptions = "none";
    selection-clipboard = "clipboard";
    statusbar-h-padding = 0;
    statusbar-v-padding = 0;
    page-padding = 0;
  };
  mappings = {
    u = "scroll half-up";
    d = "scroll half-down";
    D = "toggle_page_mode";
    R = "reload";
    r = "rotate";
    K = "zoom in";
    J = "zoom out";
    i = "recolor";
    p = "print";
    b = "toggle_statusbar";
    "<Right>" = "navigate next";
    "<Left>" = "navigate previous";
    c = "recolor";
  };
};

}
