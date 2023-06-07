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
- *Stable Internet connection*

# Installation

### On Windows

Open PowerShell with Admin privileges and run this command:

```
Set-ExecutionPolicy RemoteSigned; Invoke-WebRequest https://raw.githubusercontent.com/1ray-1/check-ip/main/install-windows.ps1 -OutFile "$PWD\install-windows.ps1";  .\install-winows.ps1
```

### On Linux
Make sure you have these installed:
- GCC

Then open terminal and type:

* ```git clone https://github.com/1RaY-1/check-ip```
* ```cd check-ip/```
* ```sh install-linux.sh```

**You'll have to enter sudo password**

# How to use (from CMD/Terminal)
```
Usage: check-ip [OPTION] IP_ADRESSES_TO_CHECK

Options:
-s            Save data to data.txt
-h, --help    Get help text
```

# How to remove

### On windows
Open CMD with admin privileges and type:
* `del C:\Windows\System32\check-ip.exe`

### On Linux
Open terminal and type:
* `sudo rm /usr/bin/check-ip`

if the above command doesn't work, type:

* `sudo rm /bin/check-ip`

**And enter sudo password**

### On Termux
Run this command:
* `rm /data/data/com.termux/files/usr/bin/check-ip`

## License
Check Ip is licensed under [MIT License](https://github.com/1RaY-1/check-ip/blob/main/LICENSE).
