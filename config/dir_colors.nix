{ pkgs, config, ... }:

{

home.file = {
  ".config/dir_colors".text = ''
COLOR tty

TERM alacritty
TERM alacritty-direct
TERM ansi
TERM *color*
TERM con[0-9]*x[0-9]*
TERM cons25
TERM console
TERM gnome
TERM gnome-256color
TERM linux
TERM linux-c
TERM putty
TERM putty-256color
TERM screen*
TERM screen-256color
TERM vt100

#+-----------------+
#+ Global Defaults +
#+-----------------+
NORMAL 00
RESET 0

FILE 00
DIR 01;34
LINK 36
MULTIHARDLINK 04;36

FIFO 04;01;36
SOCK 04;33
DOOR 04;01;36
BLK 01;33
CHR 33

ORPHAN 31
MISSING 01;37;41

EXEC 01;36

SETUID 01;04;37
SETGID 01;04;37
CAPABILITY 01;37

STICKY_OTHER_WRITABLE 01;37;44
OTHER_WRITABLE 01;04;34
STICKY 04;37;44

#+-------------------+
#+ Extension Pattern +
#+-------------------+
#+--- Archives ---+
.7z 01;31
.ace 01;31
.alz 01;31
.arc 01;31
.arj 01;31
.bz 01;31
.bz2 01;31
.cab 01;31
.cpio 01;31
.deb 01;31
.dz 01;31
.ear 01;31
.gz 01;31
.jar 01;31
.lha 01;31
.lrz 01;31
.lz 01;31
.lz4 01;31
.lzh 01;31
.lzma 01;31
.lzo 01;31
.rar 01;31
.rpm 01;31
.rz 01;31
.sar 01;31
.t7z 01;31
.tar 01;31
.taz 01;31
.tbz 01;31
.tbz2 01;31
.tgz 01;31
.tlz 01;31
.txz 01;31
.tz 01;31
.tzo 01;31
.tzst 01;31
.war 01;31
.xz 01;31
.z 01;31
.Z 01;31
.zip 01;31
.zoo 01;31
.zst 01;31

#+--- Audio ---+
.aac 31
.au 31
.flac 31
.m4a 31
.mid 31
.midi 31
.mka 31
.mp3 31
.mpa 31
.mpeg 31
.mpg 31
.ogg 31
.opus 31
.ra 31
.wav 31

#+--- Customs ---+
.3des 01;35
.aes 01;35
.gpg 01;35
.pgp 01;35
.iso 01;29
.img 01;29

#+--- Documents ---+
.doc 31
.docx 31
.dot 31
.odg 31
.odp 31
.ods 31
.odt 31
.otg 31
.otp 31
.ots 31
.ott 31
.pdf 31
.ppt 31
.pptx 31
.xls 31
.xlsx 31

#+--- Executables ---+
.app 01;36
.bat 01;36
.btm 01;36
.cmd 01;36
.com 01;36
.exe 01;36
.reg 01;36

#+--- Ignores ---+
*~ 02;37
.bak 02;37
.BAK 02;37
.log 02;37
.log 02;37
.old 02;37
.OLD 02;37
.orig 02;37
.ORIG 02;37
.swo 02;37
.swp 02;37

#+--- Images ---+
#.bmp 36
#.cgm 36
#.dl 36
#.dvi 36
#.emf 36
#.eps 36
#.gif 36
#.jpeg 36
#.jpg 36
#.JPG 36
#.mng 36
#.pbm 36
#.pcx 36
#.pgm 36
#.png 36
#.PNG 36
#.ppm 36
#.pps 36
#.ppsx 36
#.ps 36
#.svg 36
#.svgz 36
#.tga 36
#.tif 36
#.tiff 36
#.xbm 36
#.xcf 36
#.xpm 36
#.xwd 36
#.xwd 36
#.yuv 36

#+--- Video ---+
.anx 35
.asf 35
.avi 35
.axv 35
.flc 35
.fli 35
.flv 35
.gl 35
.m2v 35
.m4v 35
.mkv 35
.mov 35
.MOV 35
.mp4 35
.mpeg 35
.mpg 35
.nuv 35
.ogm 35
.ogv 35
.ogx 35
.qt 35
.rm 35
.rmvb 35
.swf 35
.vob 35
.webm 35
.wmv 35
'';
};

}
