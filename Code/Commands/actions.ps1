param (
    [switch]$a,
    [switch]$b,
    [switch]$c,
    [switch]$d,
    [switch]$e,
    [switch]$f,
    [switch]$g,
    [switch]$h,
    [switch]$i,
    [switch]$j,
    [switch]$k
)

if ($a) {
    Write-Output "Command for flag -a"
    Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", "ping 8.8.8.8"

}

######################################################

if ($b) {
# Exit safemode
Start-Process cmd.exe -Verb RunAs -ArgumentList "/k bcdedit /deletevalue {default} safeboot & pause" -ErrorAction SilentlyContinue
}
  

######################################################

if ($c) {
    Write-Output "Command for flag -c"
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
}

#######################################################

if ($d) {
# Define the script block outside the conditional block
$scriptBlock = {
    # Update: Now the script checks if choco is installed first!
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Uh Oh! It appears Chocolatey is not installed. Please install Chocolatey first."
    } else {
        # If Chocolatey is installed! Then the installation works!
        Write-Host "Chocolatey is installed. Installing Malwarebytes..."
    
        # Install Malwarebytes through Chocolatey
        # If this runs again then the version shows!
        choco install malwarebytes -y
    
        Write-Host "Malwarebytes has been installed! It should appear on your desktop."
        Write-Host "You can close this window now."
    }
}

# Start a new PowerShell process and execute the script block
Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $scriptBlock -ErrorAction SilentlyContinue

}

######################################################

if ($e) {
    # Run Defender Scan
    $scriptBlock3 = {
        # Run Windows Defender scan
        Write-Host "Starting Defender Quick Scan"
        $scanResult = Start-MpScan -ScanType QuickScan

        # Update: Scan results are now output into a file. If empty then theres nothing found
        $scanResult | Format-Table -AutoSize
        $scanResult | Out-File -FilePath "WindowsDefenderScanResults.txt"
        # Text to indicate that
        Write-Host "Scan Complete! Look for the results in the WindowsDefenderScanResults.txt file!"
        Write-Host "If the file is empty then no targets were found!"
        }
   
# Start a new PowerShell process and execute the script block
Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", $scriptBlock3 -ErrorAction SilentlyContinue

}

######################################################

if ($f) {
    # INSTALL UBlock
    $scriptBlock2 = {
        # Update: Now the script checks if choco is installed first!
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            Write-Host "Uh Oh! It appears chocolatey is installed. Please Select the INSTALL CHOCO option under START HERE please!"
        } else {
            # If choco is installed! Then the installation works!
            Write-Host "Chocolatey is installed. Installing UBlock for Chrome..."
        
            # Install Ublock Origin through chocolatey
            # If this runs again then the version shows!
            choco install ublockorigin-chrome -y
        
            Write-Host "Ublock Origin has been installed! You should get a message the next time you open Chrome!"
            Write-Host "It is ok to close this window now!"
        }
    }
# Start a new PowerShell process and execute the script block
Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $scriptBlock2 -ErrorAction SilentlyContinue
}



######################################################

if ($g) {
    # Reboot to safe mode
Start-Process cmd.exe -Verb RunAs -ArgumentList "/k bcdedit /set {default} safeboot minimal & pause" -ErrorAction SilentlyContinue

}

######################################################

if ($h) {
# INSTALL EMISOFT SEARCH AND DESTROY
$SD = {
    # Update: Now the script checks if choco is installed first!
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Uh Oh! It appears Chocolatey is not installed. Please install Chocolatey first."
    } else {
        # If Chocolatey is installed! Then the installation works!
        Write-Host "Chocolatey is installed. Installing Emisoft Emergency Kit..."
    
        # Install Emisoft through Chocolatey
        # If this runs again then the version shows!
        choco install emsisoft-emergency-kit --ignore-checksums
    
        Write-Host "Emisoft kit has been installed! It should appear on your desktop."
        Write-Host "You can close this window now."
    }
}

# Start a new PowerShell process and execute the script block
Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $SD -ErrorAction SilentlyContinue
}

######################################################

if ($i) {
    Write-Output "Command for flag -i"
    Start-Process "ms-settings:windowsdefender"
}

######################################################

if ($j) {
    Write-Output "Command for flag -j"
    
}

######################################################

if ($k) {
    Write-Output "Command for flag -k"
    
}
