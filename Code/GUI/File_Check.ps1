# Function to pull a file from a given URL
function Download-File {
    param(
        [string]$url,
        [string]$outputFile
    )
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $outputFile)
}

# Paths for the script in the provided folder, my github file moved into a temp file to be deleted
# Put into vars for organization sake
$localFilePath = "actions.ps1"
$githubFilePath = "https://raw.githubusercontent.com/FlameSpyro/Cyber-Security-Survival-Kit/main/Code/GUI/actions.ps1"
$tempFilePath = "compare_script.ps1"

# Download actions.ps1 from GitHub
Download-File -url $githubFilePath -outputFile $tempFilePath

# Compare files
if ((Get-FileHash -Path $localFilePath).Hash -eq (Get-FileHash -Path $tempFilePath).Hash) {
    # If the files match perfectly, delete the temp version of the file
    Remove-Item $tempFilePath -Force
    # My finished GUI Code will go here OR will run on a separate script
}
else {
    # If they don't match, display a message and keep the temporary file for reference
    [System.Windows.Forms.MessageBox]::Show("Uh oh! It looks like your version of the files do not line up. Either these have been altered or FS made an error. Please file an issue on the GitHub page and I'll fix it asap!")
}
