{ pkgs, config, ... }:

{

programs.zsh = {
  enable = true;
  enableAutosuggestions = true;
  enableCompletion = true;
  # syntaxHighlighting.enable = true;
  dotDir = ".config/zsh";
  autocd = true;
  history.path = ".cache/zsh/history";
  shellAliases = {
    ls="ls --color=auto --group-directories-first";
    fzf="${pkgs.fzf}/bin/fzf -m";
    tg="cd $HOME/.config/dotgit; ${pkgs.tig}/bin/tig; cd -";
    du="du -h -d 1 . 2>/dev/null | sort -h -r";
    xpg="gpg -c --no-symkey-cache --cipher-algo AES256";
    vim="${pkgs.neovim}/bin/nvim";
    tig="${pkgs.tig}/bin/tig status";
    check="${pkgs.shellcheck}/bin/shellcheck --shell=bash --exclude=SC2086,SC2016,SC1091";
    nx="${pkgs.nvd}/bin/nvd diff /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 3 | head -n 1) /nix/var/nix/profiles/$(ls /nix/var/nix/profiles/ | tail -n 2 | head -n 1)";
    dua="${pkgs.dua}/bin/dua i";
    grep="grep -i";
  };
};

home.file = {
  ".config/zsh/.zshrc".text = ''
  setopt auto_menu
  setopt menucomplete
  unsetopt prompt_cr prompt_sp

  unset zle_bracketed_paste

  source ~/.config/zsh/scripts/functions

  autoload -U colors && colors
  setopt PROMPT_SUBST

  if [[ -f /run/.containerenv && -f /run/.toolboxenv ]]; then
    PS1="%{$fg[blue]%B%}%~$fg[red] ⚫$reset_color"
  else
    PS1="%{$fg[blue]%}%~$reset_color⚡"
  fi

  zstyle ':completion:*' menu select
  zmodload zsh/complist
  compinit -d ~/.cache/zsh/zcompdump
  _comp_options+=(globdots)		# Include hidden files.

  # Edit line in vim with ctrl-e:
  autoload edit-command-line; zle -N edit-command-line

  bindkey "^[[1;5D" backward-word
  bindkey "^[[1;5C" forward-word
  bindkey "^a" beginning-of-line
  bindkey "^e" end-of-line
  bindkey '^H' backward-kill-word
  bindkey "\e[3~" delete-char

  bindkey '^v' edit-command-line
  bindkey -s '<<' 'go\n'
  bindkey -s '<z' 'ge\n'
  bindkey -s "^t" 'msd\n'
  bindkey -s '^z' 'zsh\n'
  bindkey -s '^x' 'fg\n'
  bindkey '^[x' autosuggest-execute
  bindkey '^[z' autosuggest-toggle

  # Load zsh-syntax-highlighting; should be last.
  export FZF_DEFAULT_OPTS='-e -i --height 40% --layout=reverse --border'
  source ~/.config/zsh/plugins/fzf.zsh
  source ~/.config/zsh/plugins/unicode.zsh
  source ~/.config/zsh/plugins/sudo.plugin.zsh
  source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  #source ~/.config/zsh/plugins/zsh-syntax-highlighting.zsh 2>/dev/null
  #source ~/.config/zsh/plugins/fancy-ctrl-z.plugin.zsh
  #source ~/.config/zsh/plugins/zsh-autosuggestions.zsh 2>/dev/null
'';
};

home.file = {
  ".config/zsh/.zprofile".text = ''
    source .profile
  '';
};

}
