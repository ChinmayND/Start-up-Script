@echo off
setlocal enabledelayedexpansion

:: ==========================================
:: List your Winget app IDs here, one per line
:: ==========================================

set "app1=microsoft.powertoys"
set "app2=AutoHotkey.AutoHotkey"
set "app3=vscodium+vscodium"
set "app4=vscodium+vscodium"
set "app5=ideoLAN.VLC"
set "app6=Neovim.Neovim"
set "app7=RaspberryPiFoundation.RaspberryPiImager"
set "app8=Oracle.VirtualBox"
set "app9=KDE.Krita"
set "app10=BlenderFoundation.Blender"
set "app11=KDE.KDEConnect"
set "app12=logseq.logseq"
set "app13=Nvidia.GeForceExperience"
set "app14=Voicemod.Voicemod"
set "app15=WhatsApp.WhatsApp"
set "app16=VB-Audio.Voicemeeter.Potato"

:: Total number of apps to install
set "total=16"

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
