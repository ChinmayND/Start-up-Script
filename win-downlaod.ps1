$apps = @(
    "LibreWolf.LibreWolf",
    "windowns.powertoy",
    "AutoHotkey.AutoHotkey",
    "Neovim.Neovim",
    "VSCodium.VSCodium",
    "KDE.KDEConnect",
    "Nvidia.GeForceExperience",
    "RaspberryPiFoundation.RaspberryPiImager",
    "Valve.Steam",
    "VB-Audio.Voicemeeter.Potato",
    "Voicemod.Voicemod",

)

foreach ($app in $apps) {
    Write-Host "Installing $app..." -ForegroundColor Cyan
    winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
}
Write-Host "`n✅ All apps have been installed." -ForegroundColor Green
