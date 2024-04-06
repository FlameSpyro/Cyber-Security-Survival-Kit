# GUI Script
# Import Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the from for a basic webpage
$form = New-Object System.Windows.Forms.Form
$form.Text = "CyberSecurity Survival Kit"
$form.Size = New-Object System.Drawing.Size(400,300)
$form.StartPosition = "CenterScreen"

#########################################

# Establish the four category groups

# Start Here! Group
$group1 = New-Object System.Windows.Forms.GroupBox
$group1.Text = "START HERE!"
$group1.Location = New-Object System.Drawing.Point(10,10)
$group1.Size = New-Object System.Drawing.Size(180,120)
$form.Controls.Add($group1)

# Detection Group
$group2 = New-Object System.Windows.Forms.GroupBox
$group2.Text = "Detection"
$group2.Location = New-Object System.Drawing.Point(200,10)
$group2.Size = New-Object System.Drawing.Size(180,120)
$form.Controls.Add($group2)

# Prevention Group
$group3 = New-Object System.Windows.Forms.GroupBox
$group3.Text = "Prevention"
$group3.Location = New-Object System.Drawing.Point(10,140)
$group3.Size = New-Object System.Drawing.Size(180,120)
$form.Controls.Add($group3)

# Recovery Group
$group4 = New-Object System.Windows.Forms.GroupBox
$group4.Text = "Recovery"
$group4.Location = New-Object System.Drawing.Point(200,140)
$group4.Size = New-Object System.Drawing.Size(180,120)
$form.Controls.Add($group4)

#########################################

# Start Here Buttons
# Manual
$button1 = New-Object System.Windows.Forms.Button
$button1.Text = "Manual"
$button1.Location = New-Object System.Drawing.Point(20,30)
$button1.Width = 140 # Adjusting width
$group1.Controls.Add($button1)

# Check Files
$button2 = New-Object System.Windows.Forms.Button
$button2.Text = "Verify Files"
$button2.Location = New-Object System.Drawing.Point(20,60)
$button2.Width = 140 # Adjusting width
$group1.Controls.Add($button2)

# Install Chocolatey
$button3 = New-Object System.Windows.Forms.Button
$button3.Text = "Install Chocolatey"
$button3.Location = New-Object System.Drawing.Point(20,90)
$button3.Width = 140 # Adjusting width
$group1.Controls.Add($button3)

#########################################

# Detection Buttons

# Malwarebytes
$button4 = New-Object System.Windows.Forms.Button
$button4.Text = "Malwarebytes"
$button4.Location = New-Object System.Drawing.Point(20,30)
$button4.Width = 140 # Adjusting width
$group2.Controls.Add($button4)

# Windows Defender
$button5 = New-Object System.Windows.Forms.Button
$button5.Text = "Windows Defender"
$button5.Location = New-Object System.Drawing.Point(20,60)
$button5.Width = 140 # Adjusting width
$group2.Controls.Add($button5)

# Ublock Origin
$button6 = New-Object System.Windows.Forms.Button
$button6.Text = "Ublock Origin"
$button6.Location = New-Object System.Drawing.Point(20,90)
$button6.Width = 140 # Adjusting width
$group2.Controls.Add($button6)

#########################################

# Prevention Buttons

# Safe Mode
$button7 = New-Object System.Windows.Forms.Button
$button7.Text = "Reboot to Safe Mode"
$button7.Location = New-Object System.Drawing.Point(20,30)
$button7.Width = 140 # Adjusting width
$group3.Controls.Add($button7)

# Search and Destroy
$button8 = New-Object System.Windows.Forms.Button
$button8.Text = "Search and Destroy"
$button8.Location = New-Object System.Drawing.Point(20,60)
$button8.Width = 140 # Adjusting width
$group3.Controls.Add($button8)

# Log Viewer
$button11 = New-Object System.Windows.Forms.Button
$button11.Text = "Stats for nerds"
$button11.Location = New-Object System.Drawing.Point(20,90)
$button11.Width = 140 # Adjusting width
$group3.Controls.Add($button11)

#########################################

# Recovery Buttons

# Create a Backup
$button9 = New-Object System.Windows.Forms.Button
$button9.Text = "Create a Backup"
$button9.Location = New-Object System.Drawing.Point(20,30)
$button9.Width = 140 # Adjusting width
$group4.Controls.Add($button9)

# Revert to Backup
$button0 = New-Object System.Windows.Forms.Button
$button0.Text = "Revert to Backup"
$button0.Location = New-Object System.Drawing.Point(20,60)
$button0.Width = 140 # Adjusting width
$group4.Controls.Add($button0)

#########################################

# Open the form
$form.ShowDialog() | Out-Null
