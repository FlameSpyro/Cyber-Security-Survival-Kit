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
