#Requires -RunAsAdministrator

<#
Check Ip installer for Windows.
For more info about this program, see: https://github.com/1RaY-1/check-ip
#>

$check_command = "gcc"
$needed_program = "check-ip.c"
$needed_compiled_program = "check-ip.exe"
$needed_dir = "C:\Windows\System32\"
$needed =$needed_dir+$needed_compiled_program

if ( -Not (Get-Command $check_command -errorAction SilentlyContinue))
{
    write-host "You don't have "$check_command" Installed."
    write-host "Please install it and re-run me."
    exit 1
}

# in case

if ( Test-Path -Path $needed -PathType Leaf) {
    write-host "File '$needed' already exist, will replace it. Press any key to continue."
    [Console]::ReadKey()
    Remove-Item $needed
}

gcc $needed_program -o $needed_compiled_program

Move-Item -Path $needed_compiled_program -Destination $needed_dir

write-host "Done!"

$needed_compiled_program = $needed_compiled_program.Substring(0, $needed_compiled_program.lastIndexOf('.'))
write-host "Type: '$needed_compiled_program -h' for more."
write-host "Or read README.md for more."

