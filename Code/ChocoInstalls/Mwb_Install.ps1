# First, check to see if Chocolatey is isntalled
# If not then spew to go back to installation
# Else, run the script like normal

if (-not (Test-Path "$C:ProgramData\chocolatey\choco.exe")) {
    Write-Host "Whoops! It appears Chocolatey is not installed on this machine. Please select the option INSTALL CHOCOLATEY first before going here!"
    Write-Host "This window will close in 15 seconds"
    Start-Sleep -Seconds 15
    exit
    
else {
    Write-Host "Chocolatey is installed. Proceeding with installation..."
    choco install malwarebytes
}

