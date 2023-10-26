{ pkgs, config, ... }:

{

home.file = {
  ".local/bin/apps/metatrader" = {
  executable = true;
  text = ''
#!/bin/sh

wine ~/.mt5/drive_c/"Program Files"/"MetaTrader 5"/terminal64.exe
  '';
  };
};

}
