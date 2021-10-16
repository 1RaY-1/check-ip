#!/bin/sh

# exit on any error
set -e

if ! [ -x "$(command -v gcc)" ]; then echo "Install gcc to be able to compile the program !!"; exit 1
else gcc check-ip.c -o check-ip
fi

if [ -d /data/data/com.termux/files/usr/bin/ ]; then mv check-ip /data/data/com.termux/files/usr/bin/

elif [ -d $HOME/bin/ ]; then mv check-ip $HOME/bin

elif [ -d /usr/bin/ ]; then sudo mv check-ip /usr/bin/

elif [ -d /usr/local/bin/ ]; then sudo mv check-ip /usr/local/bin/
    
elif [ -d /bin/ ]; then sudo mv check-ip /bin/

else echo "Sorry, I don't know what to do."; exit 1
fi

echo "Done!"
