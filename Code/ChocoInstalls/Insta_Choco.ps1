# Check if Excecution Policy Works
# Loop through Get-ExecutionPolicy
while ($true) {
    $executionPolicy = Get-ExecutionPolicy
    if ($executionPolicy -eq "Restricted") {
        # Set execution policy to AllSigned
        Set-ExecutionPolicy AllSigned -Scope CurrentUser -Force
        Write-Output "Execution policy has been set to AllSigned"
        break
    }
    else {
        Write-Output "Everything's a-ok!"
        break
    }
}

# Install Chocolatey (Will require restart after installation)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
