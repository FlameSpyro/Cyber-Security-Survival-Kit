# Reference: "https://smarthomepursuits.com/how-to-create-a-powershell-menu-gui/"
# First, Ensure you are allowed to run scripts on your device
set-executionpolicy remotesigned

# Install Module
Install-Module -Name PSScriptMenuGui

# Make sure to put all scripts you want to run into the same folder for convenience
# Demo .csv file is located in directory
# Launch Application
Show-ScriptMenuGui -csvPath '.\test.csv' -Verbose

# Default Configuration
#region Setup
Set-Location $PSScriptRoot
Remove-Module PSScriptMenuGui -ErrorAction SilentlyContinue
try {
    Import-Module PSScriptMenuGui -ErrorAction Stop
}
catch {
    Write-Warning $_
    Write-Verbose 'Attempting to import from parent directory...' -Verbose
    Import-Module '..\'
}
#endregion

$params = @{
    csvPath = '.\test.csv'
    windowTitle = 'IT Shared Scripts v1.1'
    buttonForegroundColor = 'Azure'
    buttonBackgroundColor = '#eb4034'
    hideConsole = $true
    noExit = $true
    Verbose = $true
}
Show-ScriptMenuGui @params
