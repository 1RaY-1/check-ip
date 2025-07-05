# About
Simple program to check if **IP addresses** are active or not using **ping** command.

## How it works

It simply **pings** a website (of your choice) and depending on the status code returned by the **ping** command, it determines the status of the website or IP address.

Possible statuses are:
- 0 => Alive
- 1 or 256 => Unreachable
- 2 or 68 => Unknown host
- [Any other code] => Unknown

## Screenshots
<br>
<img width="70%" src="imgs/example1.png"/>
<img width="70%" src="imgs/example2.png"/>
</p>

## Supported Operating Systems
- *Windows*
- *Linux*
- *Android* (via Native Linux Terminal, not tested yet)

## General Requirements
- *Internet connection*

## Installation

### On Windows

Open PowerShell with Admin privileges and run this command:

```
Set-ExecutionPolicy RemoteSigned; Invoke-WebRequest https://raw.githubusercontent.com/1ray-1/check-ip/main/install-windows.ps1 -OutFile "$PWD\install-windows.ps1";  .\install-windows.ps1
```

*After that, unless you really need to execute other PowerShell scripts, I recommend disabling script execution for better security*
```
Set-ExecutionPolicy Restricted
```

### On Linux

Open terminal and run this command:

```
wget https://raw.githubusercontent.com/1ray-1/check-ip/main/install-linux.sh; chmod +x install-linux.sh; clear; bash install-linux.sh
```

*You'll need to enter your sudo password*

***In both cases (Linux and Windows), the required executable (for your system architecture) will be installed in a directory that's in your PATH, so you can run it by simply typing check-ip in the terminal or CMD***

### From releases
You can just download the executable file for your OS [here](https://github.com/1RaY-1/check-ip/releases/latest) and execute it.

### From source
You can download this repo and compile [check-ip.c](https://github.com/1RaY-1/check-ip/blob/main/check-ip.c) manually (using C compiler).

## How to use (from CMD/Terminal)
```
Usage: check-ip [OPTION] IP_ADDRESSES_TO_CHECK

Options:
-s            Save data to data.txt
-h, --help    Get help text
```

## How to remove

### On Windows
Open CMD with admin privileges and type:
* `del C:\Windows\System32\check-ip.exe`

### On Linux
Open terminal and type:
* `sudo rm $(which check-ip)`


## More

Note: I'm not a C programmer. The code is simple and could be improved, but it works.
