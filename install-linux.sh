#!/bin/sh

# exit on any error
set -e

if ! [ `command -v gcc` ]; then echo "Please install 'gcc' and then run me again."; exit 1
else gcc check-ip.c -o check-ip
fi

# for android
if [ -d /data/data/com.termux/files/usr/bin/ ]; then 
    # in case
    if [ -f /data/data/com.termux/files/usr/bin/check-ip ]; then
        echo "Hey '/data/data/com.termux/files/usr/bin/check-ip' already exists, will replace it. Press ENTER to continue"
        read tmp
        sudo rm /data/data/com.termux/files/usr/bin/check-ip
    fi
    mv check-ip /data/data/com.termux/files/usr/bin/

# for linux
elif [ -d /usr/bin/ ]; then 
    if [ -f /usr/bin/check-ip ]; then
        echo "Hey '/usr/bin/check-ip' already exists, will replace it. Press ENTER to continue"
        read tmp
        sudo rm /usr/bin/check-ip
    fi
    sudo mv check-ip /bin/
    
elif [ -d /bin/ ]; then
    if [ -f /bin/check-ip ]; then
        echo "Hey '/bin/check-ip' already exists, will replace it. Press ENTER to continue"
        read tmp
        sudo rm /bin/check-ip
    fi
    sudo mv check-ip /bin/

else echo "Sorry, I don't know what to do."; exit 1
fi

echo "Done!"
echo "Type 'check-ip -h' for more."
echo "Or read README.md for more."