# About
Simple program to check if ip adresses are active or not using **ping** command.


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
Set-ExecutionPolicy RemoteSigned; Invoke-WebRequest https://raw.githubusercontent.com/1ray-1/check-ip/main/install-windows.ps1 -OutFile "$PWD\install-windows.ps1";  .\install-windows.ps1
```

***And confirm with a "Y"***

### On Linux/Termux
Make sure you have these installed:
- GCC

Then open terminal and type:

* ```git clone https://github.com/1RaY-1/check-ip```
* ```cd check-ip/```
* ```sh install-linux.sh```

**You'll have to enter sudo password**

### From releases
You can also download directly the executable file for your OS from [releases](https://github.com/1RaY-1/check-ip/releases/latest)

For the moment there executable files only for this OS's: linux-amd64, windows-64bit and windows-32bit

If you have another system  architecture, you have to build [check-ip.c](https://github.com/1RaY-1/check-ip/blob/main/check-ip.c) manually (using GCC).

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
