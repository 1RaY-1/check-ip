#!/usr/bin/bash
if ! [ -x "$(command -v gcc)" ]; then echo "Install gcc to be able to compile the program !!"
else gcc check-ip.c -o check-ip
fi
exit
