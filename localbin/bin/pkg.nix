{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/pkg" = {
  executable = true;
  text = ''
#!/usr/bin/env bash

RELEASE=$(cat /etc/os-release | grep ^NAME= | cut -d '=' -f2 | awk '{print $1}' | tr -d '"')


case "''${RELEASE}" in
  "")                  echo "$RELEASE is not supported!"; exit 1 ;;
  Fedora|AlmaLinux) [ -x "$(command -v rpm-ostree)" ] && INSTALL="sudo rpm-ostree install" || INSTALL="sudo dnf install"
    [ -x "$(command -v rpm-ostree)" ] && UPDATE="sudo rpm-ostree update 2>&1 | tee $HOME/.cache/pkg.log" || UPDATE="sudo dnf update"
    [ -x "$(command -v rpm-ostree)" ] && SEARCH="sudo toolbox run dnf search" || SEARCH="sudo dnf search"
    [ -x "$(command -v rpm-ostree)" ] && REMOVE="rpm-ostree remove" || REMOVE="sudo dnf remove" ;;
  Void) INSTALL="doas xbps-install -S"
    UPDATE="doas xbps-install -Su"
    SEARCH="doas xbps-query -Rs"
    REMOVE="doas xbps-remove" ;;
  Debian|Devuan) INSTALL="sudo apt install"
    UPDATE="sudo apt-get update"
    SEARCH="sudo apt search"
    REMOVE="sudo apt autoremove" ;;
  Alpine) INSTALL="doas apk -i add"
    UPDATE="doas apk -iU upgrade --available"
    SEARCH="doas apk search -v"
    REMOVE="doas apk del" ;;
  AlmaLinux|Rocky|CentOS) INSTALL="sudo dnf install"
    UPDATE="sudo dnf update"
    SEARCH="sudo dnf search"
    REMOVE="sudo dnf remove" ;;
  Arch|Artix) INSTALL="doas pacman -S"
    UPDATE="doas pacman -Syu"
    SEARCH="doas pacman -Ss"
    REMOVE="doas pacman -Rns" ;;
esac

get_status()
{
    rpm-ostree status
}

if [ $1 == "search" ]; then
    $SEARCH $2
fi

if [ $1 == "install" ]; then
    $INSTALL ''${@:2}
fi

if [ $1 == "remove" ]; then
    $REMOVE ''${@:2}
fi

if [ $1 == "override" ]; then
    rpm-ostree override remove ''${@:2}
fi

get_updates()
{
    if [ $RELEASE != NixOS ]; then
      $UPDATE
    else
      sudo nixos-rebuild --upgrade boot
    fi

    cd $HOME/.config/dotgit; ${pkgs.tig}/bin/tig status

    if [ $RELEASE = Debian ]; then
      doas apt upgrade
    fi

    if [ $RELEASE = AlmaLinux ] || [ $RELEASE = Rocky ] || [ $RELEASE = CentOS ]; then
      nix-channel --update
      nix-env -u
    fi

    echo "Looking for Flatpak updates…"
    [ -x "$(command -v flatpak)" ] && flatpak update -y
    [ -x "$(command -v toolbox)" ] && toolbox run sudo dnf update -y

    if [ $RELEASE = NixOS ]; then
      ${pkgs.nvd}/bin/nvd diff /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 3 | head -n 1) /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 2 | head -n 1)
    fi
}

switch()
{
  sudo nixos-rebuild switch
  nvd diff /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 3 | head -n 1) /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 2 | head -n 1)
}

check_updates()
{
    rpm-ostree update --check 2>&1 | tee $HOME/.cache/pkg.log
}

get_rollback()
{
    rpm-ostree rollback -r
}

preview_updates()
{
    rpm-ostree update --preview 2>&1 #| tee $HOME/.cache/pkg.log
}

if [ $1 == "pin" ]; then
    sudo ostree admin pin $(expr $2 - 1) &> /dev/null
    echo "Deployment $2 is now pinned"
fi

if [ $1 == "unpin" ]; then
sudo ostree admin pin --unpin $(expr $2 - 1) &> /dev/null
echo "Deployment $2 is now unpinned"
fi

if [ $1 == "diff" ]; then

    DIFF=$(diff --suppress-common-lines -y <(rpm-ostree status | awk "/LayeredPackages:/{++n} n==$2; /LocalPackages:/ && n==$2{exit}" | xargs -n1) \
        <(rpm-ostree status | awk "/LayeredPackages:/{++n} n==$3; /LocalPackages:/ && n==$3{exit}" | xargs -n1))

    if [[ $DIFF == *"<"* ]]; then
        echo "$(tput setaf 2)$DIFF$(tput setaf 7)"
    else
        echo "$(tput setaf 1)$DIFF$(tput setaf 7)"
    fi
fi

if [ $1 == "history" ]; then
    rpm-ostree ex history | egrep CreateCommand | sed 's/CreateCommand:/->/'
fi

clean()
{
  nix-collect-garbage -d
  nix-store --gc
  sudo nix-collect-garbage -d
  sudo nix-store --gc
  sudo nixos-rebuild boot
}

help_pkg()
{
    echo "
    pkg [OPTIONS] [PACKAGE]

    status
    install PKG
    remove PKG
    override PKG
    update/upgrade
    rollback
    check
    preview
    switch
    pin DEPLOY
    unpin DEPLOY
    diff DEPLOY1 DEPLOY2
    history
    "
}

case "''${1}" in
	"")         echo "No option was specified."; exit 1 ;;
    status)         get_status ;;
    update)         get_updates ;;
    upgrade)        get_updates ;;
    rollback)       get_rollback ;;
    check)          check_updates ;;
    preview)        preview_updates ;;
    switch)         switch ;;
    clean)          clean ;;
    help)           help_pkg ;;
esac
  '';
  };
};

}