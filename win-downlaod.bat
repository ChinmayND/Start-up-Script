@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: List your Winget app IDs here, one per line
:: ==========================================

set "app1=microsoft.powershell" 
set "app2=microsoft.appinstaller"
set "app3=AutoHotkey.AutoHotkey"
set "app4=valinet.ExplorerPatcher"
set "app5=Valve.Steam"
set "app6=vscodium.vscodium"
set "app7=Neovim.Neovim"
set "app8=RaspberryPiFoundation.RaspberryPiImager"
set "app9=Oracle.VirtualBox"
set "app10=KDE.Krita"
set "app11=BlenderFoundation.Blender"
set "app12=KDE.KDEConnect"
set "app13=logseq.logseq"
set "app14=KiCad.KiCad"
set "app15=Microsoft.PowerToys"
set "app16=9NKSQGP7F2NH" ::whatsapp
set "app17=VB-Audio.Voicemeeter.Potato"
set "app18=Audacity.Audacity"
set "app19=Inkscape.inksacpe"
set "app20=OBSProject.OBSStudio"
set "app21=XP9B0BH6T8Z7KZ"  ::voicemod
set "APP22=VideoLAN.VLC"
set "app23=glzr-io.GlazeWM"
set "app24=Nvidia.GeForceExperience"
set "app20=fastfetch-cli.fastfetch"
:: SET "app21=winget install FilesCommunity.Files"

:: Total number of apps to install
set "total=19"

:: ==========================================
:: Check if winget is installed
:: ==========================================

where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] winget not found. Please install App Installer from Microsoft Store.
    pause
    exit /b
)

:: ==========================================
:: Start installing apps
:: ==========================================

echo Starting installation...

for /L %%i in (1,1,%total%) do (
    call set "app=%%app%%i%%"
    echo Installing !app! ...
    winget install --id=!app! --silent --accept-source-agreements --accept-package-agreements
    echo.
)

echo All installations attempted.
pause
