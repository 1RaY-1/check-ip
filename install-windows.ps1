#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop" # <-- in case of an error, stop the script
<#
Check-Ip Windows Installer

If you see the error:
  “execution of scripts is disabled on this system”

It means that you have to set "ExecutionPolicy" to "RemoteSigned"

After that I recommend to always leave it as 'Restricted' for better security:
Set-ExecutionPolicy Restricted
#>

$program = "check-ip.exe"
$needed_dir = "C:\Windows\System32\"
$needed =$needed_dir+$program

# Check if system is 64-bit or 32-bit
if ( [System.Environment]::Is64BitOperatingSystem ){
    write "Downloading executable for: 64-bit OS"
    sleep 0.8
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-64bit.exe" -OutFile "$PWD\$program"
}

elseif ( [System.Environment]::Is32BitOperatingSystem ){
    write "Downloading executable for: 32-bit OS"
    sleep 0.8
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-32bit.exe" -OutFile "$PWD\$program"
}
else {
    write "Sorry, there are no executables for your system architecture"
    write "You need to compile the program yourself"
    exit
}

# Move it to C:\Windows\System32

if ( Test-Path -Path $needed -PathType Leaf) {
    write-host "File '$needed' already exist, will replace it. Press any key to continue."
    [Console]::ReadKey()
    Remove-Item $needed
}

write-host "Moving $program to $needed_dir"
sleep 1
Move-Item -Path $PWD\$program -Destination $needed_dir

write-host "Done!"

$program = $program.Substring(0, $program.lastIndexOf('.'))
write-host "Type: '$program -h' to get started."
write-host "Or read README.md."
