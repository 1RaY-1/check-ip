#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop" # <-- in case of an error, stop the script
<#
Check Ip installer for Windows.
For more info about this program, see: https://github.com/1RaY-1/check-ip

If receiving error "execution of scripts is disabled on this system", open powershell as admin and type next command:
Set-ExecutionPolicy RemoteSigned

After that I recommend to always leave it as 'Restricted' for better security:
Set-ExecutionPolicy Restricted
#>

$program = "check-ip.exe"
$needed_dir = "C:\Windows\System32\"
$needed =$needed_dir+$program

# Check if system is system is 64-bit or 32-bit
if ( [System.Environment]::Is64BitOperatingSystem ){
    write "Downloading executable for: 64-bit OS"
    sleep 0.8
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-64bit.exe" -OutFile "$PWD\$program"
}

else if ( [System.Environment]::Is32BitOperatingSystem ){
    write "Downloading executable for: 32-bit OS"
    sleep 0.8
    Invoke-WebRequest -URI "https://github.com/1RaY-1/check-ip/releases/latest/download/check-ip-32bit.exe" -OutFile "$PWD\$program"
}
else {
    write "Sorry, your system architecture is not supported"
    write "The only supported system architectures are: 64-bit and 32-bit"
    exit 1
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
