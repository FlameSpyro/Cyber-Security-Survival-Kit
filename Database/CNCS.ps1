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
$localFilePath = "KitCommands.ps1"
$githubFilePath = "https://raw.githubusercontent.com/FlameSpyro/Cyber-Security-Survival-Kit/main/Database/KitCommands.ps1"
$tempFilePath = "compare_script.ps1"

# Download actions.ps1 from GitHub
Download-File -url $githubFilePath -outputFile $tempFilePath

# Compare files
if ((Get-FileHash -Path $localFilePath).Hash -eq (Get-FileHash -Path $tempFilePath).Hash) {
    # If the files match perfectly, delete the temp version of the file
    Remove-Item $tempFilePath -Force

    # Import Windows forms which allows us to pop up a window for our GUI
    Add-Type -AssemblyName System.Windows.Forms

    # Create the form for a basic webpage
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "CyberSecurity Survival Kit"
    $form.Size = New-Object System.Drawing.Size(800,600)
    $form.StartPosition = "CenterScreen"

    # Create the title
    # The text needed to be bolded and centered
    # Originally a logo was supposed to be there but I had trouble making it fit without it looking messy
    $titleLabel = New-Object System.Windows.Forms.Label
    $titleLabel.Text = "CyberSecurity Survival Kit"
    $titleLabel.AutoSize = $true
    $titleLabel.Font = New-Object System.Drawing.Font("Arial",24,[System.Drawing.FontStyle]::Bold)
    $titleLabelX = ($form.Width - $titleLabel.PreferredWidth) / 2
    $titleLabel.Location = New-Object System.Drawing.Point($titleLabelX, 20)
    $form.Controls.Add($titleLabel)

    # Update: 
    # Buttons are now a table to make the creation process easier instead of copy/paste
    $buttons = @{
        'Start Here!' = @('Manual', 'Stats for nerds', 'Install Chocolatey')
        'Detection' = @('Malwarebytes', 'Windows Defender', 'Ublock Origin')
        'Prevention' = @('Reboot to Safe Mode', 'Search and Destroy', 'Turn off Safe Mode')
        'Recovery' = @('Create a Backup', 'Revert to Backup')
    }

    # Update: Descriptions for each button as a tooltip!
    # This was feedback given to by peers
    $descriptions = @{
        'Manual' = 'Opens the provided pdf document'
        'Stats for nerds' = 'Runs the verify files script again'
        'Install Chocolatey' = 'Installs chocolatey on the device'
        'Malwarebytes' = 'Installs Malwarebytes VIA chocolatey'
        'Windows Defender' = 'Runs a windows defender scan and prints the results'
        'Ublock Origin' = 'Installs ublock orign VIA chocolatey (Only the chrome version rn)'
        'Reboot to Safe Mode' = 'Reboots this device to safe mode'
        'Search and Destroy' = 'Installs the search and destroy program VIA choco'
        'Turn off Safe Mode' = 'Disables safe mode'
        'Create a Backup' = 'Creates a backup on the computer to a file'
        'Revert to Backup' = 'Reboots to revert to point screen on windows'
    }

    # Create group locations for easy management
    $locations = @{
        'Start Here!' = New-Object System.Drawing.Point(20,80)
        'Detection' = New-Object System.Drawing.Point(400,80)
        'Prevention' = New-Object System.Drawing.Point(20,340)
        'Recovery' = New-Object System.Drawing.Point(400,340)
    }

    # Color values to look nicer!
    $buttonColors = @('OrangeRed', 'BlanchedAlmond', 'MediumSeaGreen', 'Azure')

    # Create groups and buttons
    $groupIndex = 0
    foreach ($groupLabel in $buttons.Keys) {
        $group = New-Object System.Windows.Forms.GroupBox
        $group.Text = $groupLabel
        $group.Location = $locations[$groupLabel]
        $group.Size = New-Object System.Drawing.Size(360,240)
        $form.Controls.Add($group)

        $buttonY = 50
        foreach ($buttonLabel in $buttons[$groupLabel]) {
            $button = New-Object System.Windows.Forms.Button
            $button.Text = $buttonLabel
            $button.Location = New-Object System.Drawing.Point(40, $buttonY)
            $button.Width = 280
            $button.Height = 40
            $button.BackColor = $buttonColors[$groupIndex]
            $buttonY += 50
            $group.Controls.Add($button)

            # Add tooltip for each button
            $toolTip = New-Object System.Windows.Forms.ToolTip
            $toolTip.SetToolTip($button, $descriptions[$buttonLabel])

            # Add functionality to buttons
            # In this loop when the button is clicked, the name will be called in and run the corresponding command
            $button.Add_Click({
                $clickedButton = $this.Text
                switch ($clickedButton) {
                    'Manual' {
                        # Opens the provided pdf document
                        .\actions.ps1 -a
                    }
                    'Stats for nerds' {
                        # Runs the verify files script again
                        .\actions.ps1 -i
                    }
                    'Install Chocolatey' {
                        # Installs chocolatey on the device
                        .\actions.ps1 -c
                    }
                    'Malwarebytes' {
                        # Installs Malwarebytes VIA chocolatey
                        .\actions.ps1 -d
                    }
                    'Windows Defender' {
                        # Runs a windows defender scan and prints the results
                        .\actions.ps1 -e
                    }
                    'Ublock Origin' {
                        # Installs ublock orign VIA chocolatey
                        # Only the chrome version rn
                        .\actions.ps1 -f
                    }
                    'Reboot to Safe Mode' {
                        # reboots this device to safe mode
                        .\actions.ps1 -g
                    }
                    'Search and Destroy' {
                        # Installs the search and destroy program VIA choco
                        .\actions.ps1 -h
                    }
                    'Turn off Safe Mode' {
                        # Disabled safe mode
                        .\actions.ps1 -b
                    }
                    'Create a Backup' {
                        # Creates a backup on the computer to a file
                        .\actions.ps1 -j
                    }
                    'Revert to Backup' {
                        # Reboots to revert to point screen on windows
                        .\actions.ps1 -k
                    }
                }
            })
        }
        $groupIndex++
    }

    # Open the form
    $form.ShowDialog() | Out-Null

}
else {
    # If they don't match, display a message and keep the temporary file for reference
    [System.Windows.Forms.MessageBox]::Show("Uh oh! It looks like your version of the files do not line up. Either these have been altered or FS made an error. Please file an issue on the GitHub page and I'll fix it asap!")
}
