#!/bin/bash

# exit on any error
set -e

if ! [ `command -v wget` ]; then
    echo "Need 'wget' package installed to download files from github!"
    exit 1
fi

echo -ne "Check-Ip installer for Linux\n\n"
sleep 1.5s

case $(uname -m) in
    x86_64) ARCH="amd64" 
    echo "Downloading ${ARCH} executable..."; sleep 1s
    wget -O check-ip https://github.com/1ray-1/check-ip/releases/latest/download/check-ip-${ARCH}
    ;;
    i386 | i686) ARCH="32-bit" 
    echo "Downloading ${ARCH} executable..."; sleep 1s
    wget -O check-ip https://github.com/1ray-1/check-ip/releases/latest/download/check-ip-${ARCH}
    ;;
    *)
    echo "Will compile it from source"; sleep 1s
    wget https://raw.githubusercontent.com/1ray-1/check-ip/main/check-ip.c
    if [ `command -v gcc` ]; then
        gcc check-ip.c -o check-ip || echo "Something went wrong!"
    elif [ `command -v clang` ]; then
        clang check-ip.c -o check-ip || echo "Something went wrong!"
    else
        echo "Looks like C compiler is not installed or something went wrong!"
        exit 1
    fi

    echo "Compiled successfully"
    sleep 2s
    ;;
esac

chmod +x check-ip

if [ -d /usr/bin/ ]; then
    echo "Installing check-ip in /usr/bin/";sleep 1s
    if [ -f /usr/bin/check-ip ]; then
        echo "Hey '/usr/bin/check-ip' already exists, will replace it. Press ENTER to continue"
        read tmp
        sudo rm /usr/bin/check-ip
    fi
    sudo mv check-ip /bin/
    
elif [ -d /bin/ ]; then
    echo "Installing check-ip in /bin/";sleep 1s
    if [ -f /bin/check-ip ]; then
        echo "Hey '/bin/check-ip' already exists, will replace it. Press ENTER to continue"
        read tmp
        sudo rm /bin/check-ip
    fi
    sudo mv check-ip /bin/

else echo "Sorry, I don't know what to do."; exit 1
fi

if ! [ `command -v check-ip` ]; then
    echo "Sorry, looks like 'check-ip' wasn't installed successfully"
    exit 1
fi

echo -ne "Done!\nType 'check-ip -h' to get started."
echo "Or read README.md for more info."
exit 0
