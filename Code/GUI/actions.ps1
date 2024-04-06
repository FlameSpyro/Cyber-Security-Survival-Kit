param (
    [switch]$a,
    [switch]$b,
    [switch]$c,
    [switch]$d,
    [switch]$e,
    [switch]$f
)

if ($a) {
    Write-Output "Command for flag -a"
    ping 8.8.8.8
}

if ($b) {
    Write-Output "Command for flag -b"
    ping champlain.edu
}

if ($c) {
    Write-Output "Command for flag -c"
    ping 8.8.8.8
}

if ($d) {
    Write-Output "Command for flag -d"
    Start-Process "ms-settings:windowsdefender"
}

if ($e) {
    Write-Output "Command for flag -e"
    
}

if ($f) {
    Write-Output "Command for flag -f"
    
}

if ($g) {
    Write-Output "Command for flag -b"
    ping champlain.edu
}

if ($h) {
    Write-Output "Command for flag -c"
    ping 8.8.8.8
}

if ($i) {
    Write-Output "Command for flag -d"
    Start-Process "ms-settings:windowsdefender"
}

if ($j) {
    Write-Output "Command for flag -e"
    
}

if ($k) {
    Write-Output "Command for flag -f"
    
}

if ($f) {
    Write-Output "Command for flag -f"
    
}

