#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"
<#
Check Ip installer for Windows.
For more info about this program, see: https://github.com/1RaY-1/check-ip

If receiving error "execution of scripts is disabled on this system", open powershell as admin and type next command:
Set-ExecutionPolicy RemoteSigned
#>

$program = "check-ip.exe"
$needed_dir = "C:\Windows\System32\"
$needed =$needed_dir+$program

# Check if system is AMD64 or I386
if ((Get-WmiObject win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit"){
    write "Downloading executable for: 64-bit OS"
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-64bit.exe" -OutFile "$PWD\$program"
}
else{
    write "Downloading executable for: 32-bit OS"
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-32bit.exe" -OutFile "$PWD\$program"
}

# Move it to C:\Windows\System32

if ( Test-Path -Path $needed -PathType Leaf) {
    write-host "File '$needed' already exist, will replace it. Press any key to continue."
    [Console]::ReadKey()
    Remove-Item $needed
}

Move-Item -Path $PWD\$program -Destination $needed_dir

write-host "Done!"

$program = $program.Substring(0, $program.lastIndexOf('.'))
write-host "Type: '$program -h' to get started."
write-host "Or read README.md."
