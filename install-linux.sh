#!/bin/bash

# exit on any error
set -e

# if you want to remove check-ip but don't remember how to do so manually, you can execute this script with '-r' argument and it'll remove it
# bash install-linux.sh -r
if [[ $1 == "-r" ]] || [[ $1 == "--remove" ]] ; then
    if [[ -f "$(which check-ip)" ]]; then
        echo -e "Will delete $(which check-ip)\nPress ENTER to proceed"
        read
        sudo rm $(which check-ip)
        if [ $? -eq 0 ]; then
            echo "Done"
            exit 0
        fi
    elif ! [[ -f "$(which check-ip)" ]]; then
        echo "Check-ip doesn't appear to be installed"
        exit 0
    fi
    exit
fi

if ! [ `command -v wget` ]; then
    echo "Need 'wget' package installed to download files from github"
    exit 1
fi

echo -e "Check-Ip installer for Linux\n"
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
    echo "Your system architecture doesn't appear to be 64-bit or 32-bit"
    echo "Will compile check-ip manually (press ENTER to continue)"
    read
    wget https://raw.githubusercontent.com/1ray-1/check-ip/main/check-ip.c

    if [ `command -v gcc` ]; then
        gcc check-ip.c -o check-ip
#       see if it compiled succesfully or not
        if [ $? -ne 0 ]; then
            echo "Something went wrong!"
            exit 1
        fi
    elif [ `command -v clang` ]; then
        clang check-ip.c -o check-ip
        if [ $? -ne 0 ]; then
            echo "Something went wrong!"
            exit 1
        fi
    else
        echo "Looks like C compiler is not installed on your system"
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

echo "Complete!
Type 'check-ip -h' to get started.
Or read README.md for more info."
exit 0
