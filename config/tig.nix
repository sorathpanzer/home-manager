{ pkgs, config, ... }:

{

home.file = {
  ".config/tig/config".text = ''
set refresh-mode = periodic		# Enum: manual, auto, after-command, periodic

bind generic q quit
bind status	x +bash -c 'echo "update" > /tmp/commit; ${pkgs.foot}/bin/foot ${pkgs.neovim}/bin/nvim /tmp/commit; ${pkgs.git}/bin/git commit -m "$(cat /tmp/commit)"; git push origin master; rm /tmp/commit'
bind status	X +bash -c 'echo "update" > /tmp/commit; ${pkgs.foot}/bin/foot ${pkgs.neovim}/bin/nvim /tmp/commit; ${pkgs.git}/bin/git commit -m "$(cat /tmp/commit)"; git push origin main; rm /tmp/commit'
bind status <Space> status-update
'';
};

}
