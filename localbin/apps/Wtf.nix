{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/apps/Wtf" = {
  executable = true;
  text = ''
#!/bin/sh

${pkgs.whatsapp-for-linux}/bin/whatsapp-for-linux
  '';
  };
};

}
