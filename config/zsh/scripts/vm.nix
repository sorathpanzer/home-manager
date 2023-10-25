{ pkgs, config, ... }:

{

home.file = {
  ".config/zsh/scripts/vm".text = ''
#!/usr/bin/env bash

vm() {
OVMF="$HOME/.local/bin/assets/OVMF_CODE.fd"
mkdir -p $HOME/.local/share/vm

if [ $1 == "create" ]; then
    ISO="$(ls $HOME/Transferências | grep -E "iso|img|usb" | fzf)"
    echo "Name for the disk"
    read NAME
    qemu-img create -f qcow2 $HOME/.local/share/vm/$NAME.img 50G
    echo "Created $NAME virtual disk with maximum 30 G"
    qemu-system-x86_64 -bios $OVMF -enable-kvm -cdrom $HOME/Transferências/$ISO -boot order=c -drive file=$HOME/.local/share/vm/$NAME.img,if=none,id=D22 -device nvme,drive=D22,serial=1234 -m 4G -cpu host -device virtio-vga-gl -display sdl,gl=on
fi

if [ $1 == "install" ]; then
    qemu-system-x86_64 -bios $OVMF -enable-kvm -cdrom $HOME/Transferências/$(ls $HOME/Transferências | grep -E "iso|img|usb" | fzf) -boot menu=on -drive file=$HOME/.local/share/vm/$2.img,if=none,id=D22 -device nvme,drive=D22,serial=1234 -m 4G -cpu host -device virtio-vga-gl -display sdl,gl=on
fi

if [ $1 == "boot" ]; then
    qemu-system-x86_64 -bios $OVMF -enable-kvm -boot order=d -drive file=$HOME/.local/share/vm/$(ls $HOME/.local/share/vm | cut -f1 -d'.' | fzf).img,if=none,id=D22 -device nvme,drive=D22,serial=1234 -m 4G -cpu host -device virtio-vga-gl -display sdl,gl=on -net user,hostfwd=tcp::10022-:22 -net nic
fi

if [ $1 == "snap" ]; then
    DISK="$HOME/.local/share/vm/$(ls $HOME/.local/share/vm | cut -f1 -d'.' | fzf)"
    echo "Give a name for the snapshot:"
    read SNAPNAME
    echo "Creating Snapshot..."
    cp $DISK.img $DISK-$SNAPNAME.img
fi

if [ $1 == "rm" ]; then
    rm $HOME/.local/share/vm/$(ls $HOME/.local/share/vm | cut -f1 -d'.' | fzf).img
fi

if [ $1 == "rename" ]; then
    DISK="$HOME/.local/share/vm/$(ls $HOME/.local/share/vm | cut -f1 -d'.' | fzf).img"
    echo "Rename to:"
    read NAME
    mv $DISK $HOME/.local/share/vm/$NAME.img
fi

if ! [[ $1 =~ ^(create|install|boot|help|snap|rm|rename|ls)$ ]]; then
    qemu-system-x86_64 -enable-kvm -boot order=d -drive file=$HOME/.local/share/vm/$1.img -m 4G -cpu host -vga virtio -display sdl,gl=on &
fi


if [ $1 == "ls" ]; then
    ls $HOME/.local/share/vm
fi

if [ $1 == "help" ]; then
    echo "vm create....................... Create a disk and boot iso
vm install...................... Boot install iso in specific disk
vm <NAMEDISK>................... Boot disk
vm boot......................... Boot disk
vm snap......................... Snapshot of a specific disk
vm rm........................... Remove disk
vm rename....................... Rename disk
vm ls........................... List disks"
fi
}
'';
};

}
