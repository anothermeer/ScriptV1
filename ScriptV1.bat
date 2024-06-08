::      
::                             _____           _       _    __      ____ 
::                            / ____|         (_)     | |   \ \    / /_ |
::                           | (___   ___ _ __ _ _ __ | |_   \ \  / / | |
::                            \___ \ / __| '__| | '_ \| __|   \ \/ /  | |
::                            ____) | (__| |  | | |_) | |_     \  /   | |
::                           |_____/ \___|_|  |_| .__/ \__|     \/    |_|
::                                              | |                      
::                                              |_|                      
::     
::        |====================================================================================|
::        |                                    Script V1                                       |
::        |                                                                                    |
::        |      This is a tool to install all my application that I need on windows.          |
::        |      You can modify it, execute it on your own computer but selling it is          |
::        |      prohibited.                                                                   |
::        |                                                                                    |
::        |      Version : 1.0                                                                 |
::        |      Made by : Anothermeer                                                         |
::        |      :)                                                                            |
::        |                                                                                    |
::        |====================================================================================|




@echo off
echo initializing... please wait...
title Script V1 by Anothermeer
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
echo [Info] Set variables.

:: adminstrator permission grabber by endermanch/matt, changed something ::

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "ELEV " >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"
echo UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

echo [Info] Get admin priviledges.
echo [Info] Setting up...
echo [Info] Getting OS info...
powershell (Get-WmiObject -class Win32_OperatingSystem).Caption
echo [Info] Getting install list...
:: Install List : 
:: subterfuge (game)
:: Steam
:: Tlauncher
:: Roblox
:: Typescript
:: NPM
:: Node.js
:: Chocolately
:: Git
:: Github desktop
:: VS Code
:: VS 2019 Community Edition
:: Python 3.9.1
:: Python 3.10.11
:: Python 3.12.4
:: Scratch 3
:: Notepad++
:: BCUninstaller
:: Geek Uninstaller free version
:: Unity Hub
:: Godot
:: GameMaker
:: Adobe Acrobat DC
:: Adobe AE CS4
:: Adobe AE 2021
:: Adobe Illustrator 2020
:: Adobe Photoshop 2020
:: Adobe Air
:: Autodesk 3ds Max 2022
:: Blender
:: Huorong Security
:: Tailscale
:: VLC media player
:: FFMPEG
:: 剪影专业版
:: Cyberlink Power
:: Wondershare Flimora
:: Audacity
:: Krita
:: 7-Zip
:: Zip Genius
:: Anydesk
:: TeamViewer
:: Filezilla
:: Putty
:: Google Chrome
:: Mozilla Firefox
:: Opera GX
:: Tor Browser
:: Whatsapp
:: Wechat
:: Translucent TB
:: Files
:: Rainmeter
:: Monero GUI Wallet
:: XMRIG
:: QEMU
:: Vmware Workstation
:: PowerToys
:: java 8
:: Icecream PDF Split and Merge
:: Treesize Free
:: OBS Studio
:: WSL
:: uTorrent
:: IDM
:: 哔哩哔哩
:: IObit Unlocker
:: ownCloud
:: SD Card Formatter
:: WInaero Tweaker
:: Wireshark
:: :Total Installs : 74 apps
:: :Total Catagories : 20 catagories

echo [Info] Defining Download links...
:: uses git to clone
set L_subterfuge=https://github.com/face-hh/subterfuge.git
:: uses exe installer to install
set L_steam=https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
set L_tlauncher=https://tlauncher.org/installer
set L_roblox=https://www.roblox.com/download/client?os=win
set L_7zip=https://7-zip.org/a/7z2406-x64.exe

echo.
echo [Info] setup done.
echo [Info] running main menu...
pause
goto mainmenu

::           M  A  I  N     C  O  D  E           ::
:mainmenu
cls
title Main Menu - Script V1 by Anothermeer
echo.
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           l                  Main Menu                    l
echo           l                                               l
echo           l   Available Options :                         l
echo           l   1. Full Install                             l
echo           l   2. Manual Install                           l
echo           l   3. Registry Tweak                           l
echo           l   4. List Information                         l
echo           l   E. Exit Script V1                           l
echo           l                                               l
echo           =================================================
echo.
choice /c 1234E /n /m ".         Choice :  "
if %ERRORLEVEL%==0 goto BreakExit
if %ERRORLEVEL%==1 goto FullInst
if %ERRORLEVEL%==2 goto ManInst
if %ERRORLEVEL%==3 goto RegTweak
if %ERRORLEVEL%==4 goto ListInfo
if %ERRORLEVEL%==5 goto CleanExit
if %ERRORLEVEL%==255 goto ErrExit

:FullInst
cls
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           =================================================
echo.
echo [Info] Manual Install selected, confirm? [Y=Continue, n=Back]
choice /c yn /n /m "[Y/n] >  "
if %ERRORLEVEL%==0 goto BreakExit
if %ERRORLEVEL%==1 goto FullInstContinue
if %ERRORLEVEL%==2 goto mainmenu
if %ERRORLEVEL%==255 goto ErrExit

:FullInstContinue
cls
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           =================================================
echo.
echo [Info] Install will start now.
echo [Info] Installing Required tools...
echo [Info] Download and Installing Chocolately using powershell
powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
echo [Info] Downloading 7-Zip