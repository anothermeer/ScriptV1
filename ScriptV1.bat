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
cd %~dp0
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
:: Scratch 2
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
:: uses CLI to install