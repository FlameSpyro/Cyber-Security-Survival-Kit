# Import Windows forms which allows us to pop up a window for our GUI
Add-Type -AssemblyName System.Windows.Forms

# Create the form for a basic webpage
$form = New-Object System.Windows.Forms.Form
$form.Text = "CyberSecurity Survival Kit"
$form.Size = New-Object System.Drawing.Size(800,600)
$form.StartPosition = "CenterScreen"

#########################################

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

#########################################

# Update: 
# Buttons are now a table to make the creation process easier instead of copy/paste
$buttons = @{
    'Start Here!' = @('Manual', 'Verify Files', 'Install Chocolatey')
    'Detection' = @('Malwarebytes', 'Windows Defender', 'Ublock Origin')
    'Prevention' = @('Reboot to Safe Mode', 'Search and Destroy', 'Stats for nerds')
    'Recovery' = @('Create a Backup', 'Revert to Backup')
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

        # Add functionality to buttons
        # In this loop when the button is clicked, the name will be called in and run the corresponding command
        $button.Add_Click({
            $clickedButton = $this.Text
            switch ($clickedButton) {
                'Manual' {
                    # Opens the provided pdf document
                    .\actions.ps1 -a
                }
                'Verify Files' {
                    # Runs the verify files script again
                    .\actions.ps1 -b
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
                'Stats for nerds' {
                    # Opens a system log that monitors computer activity
                    .\actions.ps1 -i
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
