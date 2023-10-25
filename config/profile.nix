{ pkgs, config, ... }:

{

home.file = {
  ".profile".text = ''
    #!/bin/sh

    RELEASE=$(cat /etc/os-release | grep ^NAME= | cut -d '=' -f2 | awk '{print $1}' | tr -d '"')
    if [ $RELEASE = AlmaLinux ] || [ $RELEASE = Rocky ] || [ $RELEASE = CentOS ] || [ $RELEASE = Artix ] || [ $RELEASE = Debian ]; then
      source /etc/profile.d/nix.sh
    fi

    export EDITOR="${pkgs.helix}/bin/hx"
    export TERMINAL="${pkgs.foot}/bin/foot"
    export READER="${pkgs.zathura}/bin/zathura"
    export TERM=vt100

    # ~/ Clean-up:
    export XDG_STATE_HOME="$HOME/.local/state"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
    export ZDOTDIR="$HOME/.config/zsh"
    export _JAVA_AWT_WM_NONREPARENTING=1
    export FZF_DEFAULT_COMMAND="find -L $HOME/.config $HOME/.local/bin -maxdepth 4 -path $HOME/.nix-defexpr -prune -o -type d"

    PATH="$PATH:$HOME/.local/bin"
    PATH="$PATH:$HOME/.local/bin/dblocks"
    PATH="$PATH:$HOME/.local/bin/lfx"
    PATH="$PATH:$HOME/.local/bin/utils"
    PATH="$PATH:$HOME/.local/bin/flatpaks"
    eval $( dircolors -b $HOME/.config/dir_colors )

    if [ "$(tty)" = "/dev/tty1" ]; then
      hyprstart
    fi
  '';
};

}
