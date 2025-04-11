Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Winget App Installer"
$form.Size = New-Object System.Drawing.Size(400, 500)
$form.StartPosition = "CenterScreen"

# App list - customize this with your preferred apps and winget IDs
$apps = @{
    "librewolf" = "librewolf.librewolf"
    "powertoys" = "microsoft.powertoys"
    "autohotkey" = "AutoHotkey.AutoHotkey"
    "vscodium" = "vscodium+vscodium"
    "steam" = "Valve.Steam"
    "Notepad++" = "Notepad++.Notepad++"
    "VLC" = "VideoLAN.VLC"
    "neovim" ="Neovim.Neovim"
    "rpi-imager" = "RaspberryPiFoundation.RaspberryPiImager"
    "virtualbox" = "Oracle.VirtualBox"
    "krita" = "KDE.Krita"
    "blender" = "BlenderFoundation.Blender"
    "kde-connect" = "KDE.KDEConnect"
    "logseq" = "logseq.logseq"
    "nvidia" = "Nvidia.GeForceExperience"
    "voicemod" = "Voicemod.Voicemod"
    "whatsapp" = "WhatsApp.WhatsApp"
    "voicemeeter" = "VB-Audio.Voicemeeter.Potato"

}

# Create a panel to hold checkboxes
$panel = New-Object System.Windows.Forms.Panel
$panel.AutoScroll = $true
$panel.Size = New-Object System.Drawing.Size(360, 350)
$panel.Location = New-Object System.Drawing.Point(10,10)

# Add checkboxes for each app
$checkboxes = @{}
$y = 10
foreach ($name in $apps.Keys) {
    $cb = New-Object System.Windows.Forms.CheckBox
    $cb.Text = $name
    $cb.Location = New-Object System.Drawing.Point(10, $y)
    $cb.AutoSize = $true
    $checkboxes[$name] = $cb
    $panel.Controls.Add($cb)
    $y += 30
}

$form.Controls.Add($panel)

# Install button
$installButton = New-Object System.Windows.Forms.Button
$installButton.Text = "Install Selected Apps"
$installButton.Size = New-Object System.Drawing.Size(160, 30)
$installButton.Location = New-Object System.Drawing.Point(110, 380)
$installButton.Add_Click({
    foreach ($name in $checkboxes.Keys) {
        if ($checkboxes[$name].Checked) {
            $id = $apps[$name]
            Start-Process "winget" -ArgumentList "install --id=$id --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow -Wait
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Selected apps installed successfully!", "Done", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})

$form.Controls.Add($installButton)

# Run the form
[void]$form.ShowDialog()
