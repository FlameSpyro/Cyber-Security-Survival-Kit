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
    # Flag -a: Open Manual
    # Get the path of the directory where the script is located
    $scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

    # Construct the full path to the PDF file
    $pdfFilePath = Join-Path -Path $scriptDirectory -ChildPath "Manual.pdf"

    # Check if the PDF file exists
    if (Test-Path $pdfFilePath) {
        # Open the PDF file using the default PDF viewer
        Invoke-Item $pdfFilePath
    } else {
    Write-Host "PDF file not found: $pdfFilePath"
    }

}

if ($b) {
    # Flag -b: Exit safe mode
    Start-Process cmd.exe -Verb RunAs -ArgumentList "/k bcdedit /deletevalue {default} safeboot & pause" -ErrorAction SilentlyContinue
}

if ($c) {
    # Flag -c: Install Chocolatey and Malwarebytes
    Write-Output "Command for flag -c"
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
}

if ($d) {
    # Flag -d: Install Malwarebytes through Chocolatey
    $scriptBlock = {
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            Write-Host "Chocolatey is not installed. Please install Chocolatey first."
        } else {
            Write-Host "Installing Malwarebytes..."
            choco install malwarebytes -y
            Write-Host "Malwarebytes has been installed!"
        }
    }
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $scriptBlock -ErrorAction SilentlyContinue
}

if ($e) {
    # Flag -e: Run Windows Defender Quick Scan
    $scriptBlock3 = {
        Write-Host "Starting Defender Quick Scan"
        $scanResult = Start-MpScan -ScanType QuickScan
        $scanResult | Format-Table -AutoSize
        $scanResult | Out-File -FilePath "WindowsDefenderScanResults.txt"
        Write-Host "Scan Complete! Results in WindowsDefenderScanResults.txt"
    }
    Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", $scriptBlock3 -ErrorAction SilentlyContinue
}

if ($f) {
    # Flag -f: Install uBlock Origin for Chrome through Chocolatey
    $scriptBlock2 = {
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            Write-Host "Chocolatey is not installed. Please install Chocolatey first."
        } else {
            Write-Host "Installing uBlock Origin for Chrome..."
            choco install ublockorigin-chrome -y
            Write-Host "uBlock Origin has been installed!"
        }
    }
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $scriptBlock2 -ErrorAction SilentlyContinue
}

if ($g) {
    # Flag -g: Set system to boot into safe mode
    Start-Process cmd.exe -Verb RunAs -ArgumentList "/k bcdedit /set {default} safeboot minimal & pause" -ErrorAction SilentlyContinue
}

if ($h) {
    # Flag -h: Install Emsisoft Emergency Kit through Chocolatey
    $SD = {
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            Write-Host "Chocolatey is not installed. Please install Chocolatey first."
        } else {
            Write-Host "Installing Emsisoft Emergency Kit..."
            choco install emsisoft-emergency-kit --ignore-checksums
            Write-Host "Emsisoft Emergency Kit has been installed!"
        }
    }
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $SD -ErrorAction SilentlyContinue
}

if ($i) {
    # Flag -i: Monitor file changes on C: drive
    $Monitor = {
        $watcher = New-Object System.IO.FileSystemWatcher
        $watcher.Path = "C:\"
        $watcher.IncludeSubdirectories = $true
        $watcher.EnableRaisingEvents = $true

        $action = {
            $eventArgs = $Event.SourceEventArgs
            Write-Host "File changed: $($eventArgs.FullPath)"
        }

        Unregister-Event -SourceIdentifier FileChanged -ErrorAction SilentlyContinue
        Register-ObjectEvent -InputObject $watcher -EventName Changed -SourceIdentifier FileChanged -Action $action

        Write-Host "Monitoring entire C: drive for file changes..."
        Write-Host "You may close this window whenever you wish!"

        while ($true) {
            Start-Sleep -Seconds 10
        }
    }

    $encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Monitor))
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-EncodedCommand", $encodedCommand -ErrorAction SilentlyContinue
}

if ($j) {
    # Flag -j: Create a system restore point
    $description = "Test Restore Point"
    $restoreCommand = "Checkpoint-Computer -Description '$description' -RestorePointType 'MODIFY_SETTINGS'"
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoExit", "-Command", $restoreCommand -ErrorAction SilentlyContinue
}

if ($k) {
    # Flag -k: Open System Restore utility
    Start-Process SystemPropertiesRestore
}
