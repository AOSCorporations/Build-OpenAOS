#!/bin/bash

if [ "$1" == "--autoremove" ]; then
    echo Starting Program
    sleep 1.5
    clear
    echo Performing autoremove of unused packages
    echo ""
    sudo apt autoremove
    echo "Do you want also to remove the 'build' directory (if not used now)?"
    read autoremovebuild
    if [[ "$autoremovebuild" == "y" ]]; then
        sudo rm -r build
    else
        clear
        exit
    fi
else
    echo Starting Program
    sleep 0.5
    clear
    echo Weclome to the AOS Building Program
    echo Press "(x) key" to exit or "(s)" "key" to start
    read input

    if [[ "$input" == "s" ]]; then
        echo starting process
        sleep 1.5
        echo Installing Dependencies needed to build openAOS
                sudo apt-get install \
                binutils \
                debootstrap \
                squashfs-tools \
                xorriso \
                grub-pc-bin \
                grub-efi-amd64-bin \
                mtools
                mkdir build
                echo downloading and compiling debian base. this might take a while
                sleep 1.0
                sudo debootstrap \
                --arch=amd64 \
                --variant=minbase \
                focal \
                ./build/chroot \
                http://us.archive.ubuntu.com/ubuntu/
                sudo mount --bind /dev ./build/chroot/dev
                sudo mount --bind /run ./build/chroot/run
    elif [[ "$input" == "S" ]]; then
        echo Starting Process
        sleep 1.5
        echo Installing Dependencies needed to build openAOS
                sudo apt-get install \
                binutils \
                debootstrap \
                squashfs-tools \
                xorriso \
                grub-pc-bin \
                grub-efi-amd64-bin \
                mtools
                mkdir build
                echo downloading and compiling debian base. this might take a while
                sleep 1.0
                sudo debootstrap \
                --arch=amd64 \
                --variant=minbase \
                focal \
                ./build/chroot \
                http://us.archive.ubuntu.com/ubuntu/
                sudo mount --bind /dev ./build/chroot/dev
                sudo mount --bind /run ./build/chroot/run
    elif [[ "$input" == "x" ]]; then
        echo abort
        sleep 0.3
        clear
        exit
    elif [[ "$input" == "X" ]]; then
        echo abort
        sleep 0.3
        clear
        exit
    else
        echo Default Activity: abort
        sleep 0.3
        clear
        exit
    fi

fi

