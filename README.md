# About
Simple program to check if ip adresses are active or not using shell/cmd **ping** command.


# Screenshots
<br>
<img width="70%" src="imgs/example1.png"/>
<img width="70%" src="imgs/example2.png"/>
</p>

# Supported Operating System
- *Windows*
- *Linux*
- *Android* (via Termux App)

# General Requierements
- *Internet connection*

# Installation

### On Windows
First of all, make sure you have:
- Modern PowerShell version
- MINGW

Then:

- Download this repo, extract it and open it.

Open PowerShell with Admin permissions in this folder and type:

- `Set-ExecutionPolicy RemoteSigned` (this is in case to execute powershell script without any problems)
- `.\install-windows.ps1`

**If you are facing problems with install script, it's not a big deal, just do this:**
1: Open CMD in this dir and type 'gcc check-ip.c -o check-ip.exe'
2: Move 'check-ip.exe' to 'C:\Windows\System32' (Manually, using GUI)
3: Grant permission to move the program there.

### On Linux
First of all, make sure you have:
- GCC

Then open terminal and type:

* ```git clone https://github.com/1RaY-1/check-ip```
* ```cd check-ip/```
* ```sh install-linux.sh```

**You'll have to grant sudo permission**

# How to use (from CMD/Terminal)
```
Usage: check-ip [OPTION] IP_ADRESSES_TO_CHECK

Options:
-s            Save data to data.txt
-h, --help    Get help text
```

# How to remove

### On windows
Open CMD with admin persmissions and type:
* `del C:\Windows\System32\check-ip.exe`

### On Linux
Open terminal and type:
* `sudo rm /usr/bin/check-ip`

if doesn't work, type:

* `sudo rm /bin/check-ip`

**And enter sudo password**

## More 
If you can help me improving this program, I would be very happy.

## License
Check Ip is licensed under [MIT License](https://github.com/1RaY-1/check-ip/blob/main/LICENSE).

