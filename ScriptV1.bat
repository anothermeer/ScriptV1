:: If you see a bunch of dashes and spaces, this is normal because it's an ASCII art.
:: Remember to see it on your computer or in vertical screen.
::
::      
::                             _____           _       _    __      __ __ 
::                            / ____|         (_)     | |   \ \    / /|_ |
::                           | (___   ___ _ __ _ _ __ | |_   \ \  / /  | |
::                            \___ \ / __| '__| | '_ \| __|   \ \/ /   | |
::                            ____) | (__| |  | | |_) | |_     \  /    | |
::                           |_____/ \___|_|  |_| .__/ \__|     \/     |_|
::                                              | |                      
::                                              |_|                      
::     
::        +====================================================================================+
::        |                                    Script V1                                       |
::        |                                                                                    |
::        |      This is a tool to install all my application that I need on windows.          |
::        |      You can modify it, execute it on your own computer but selling it is          |
::        |      prohibited.                                                                   |
::        |                                                                                    |
::        |      Version : 1.0.1                                                               |
::        |      Made by : Anothermeer                                                         |
::        |      :)                                                                            |
::        |                                                                                    |
::        +====================================================================================+
::

#include ScriptV1_IDT_clean

@echo off
:: set window size
mode con: cols=96 lines=18
cls
echo initializing... please wait...
title Script V1 by Anothermeer
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
set IDKeyPart=%random%%random%%random%%random%
set IDKey=%IDKeyPart%%IDKeyPart%
setlocal EnableDelayedExpansion
echo [42m[Info][0m Set variables.

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

echo [42m[Info][0m Get admin priviledges.
mode con: cols=96 lines=18
echo [42m[Info][0m Setting up...
:: select install folder
:selfolnotavailagain
echo [Input] Please enter the full path of the folder that you want to install the applications in.
set /P InstPath="Path >  "
echo [42m[Info][0m Testing the folder is availible...
:: test if the selected folder exists
if exist %InstPath%\ (goto selfolavail) else (goto selfolnotavail)
:selfolavail
echo [42m[Info][0m Output : Folder is Available!
echo [42m[Info][0m creating external folders...
pushd %InstPath%
:: make install folder
mkdir --installer
mkdir 7zip
mkdir git
set InstallerPath=%InstPath%\--installer\
popd
echo [42m[Info][0m checking for temp folder...
if exist %temp%\ScriptV1 (goto tmpfolexist) else (goto tmpfolnotexist)
:tmpfolnotexist
echo [42m[Info][0m temp folder not exist, creating...
mkdir %temp%\ScriptV1
echo TMPSTART > %temp%\ScriptV1\OSName.txt
goto continit
:tmpfolexist
echo [42m[Info][0m temp folder exists, deleting and recreating...
del /f /q /a %temp%\ScriptV1\
mkdir %temp%\ScriptV1
echo TMPSTART > %temp%\ScriptV1\OSName.txt
goto continit
:selfolnotavail
echo [42m[Info][0m Output : Folder is not Available!
echo [42m[Info][0m Please reenter the path.
goto selfolnotavailagain
:continit
echo [42m[Info][0m Getting OS info...
systeminfo | findstr "OS\ Name" | findstr /v Connection | findstr /v Host > %temp%\ScriptV1\OSName.txt
set /p os=< %temp%\ScriptV1\OSName.txt
del OSName.txt
echo [42m[Info][0m Setting registry...
reg add HKCU\Console\AnothermeerBatchScripts /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v ScriptVersion /t REG_SZ /d 1.0.1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v IdentityKey /t REG_SZ /d %IDKey% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v OSName /t REG_SZ /d %OSName% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v InstallerPath /t REG_SZ /d %InstallerPath% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v InstPath /t REG_SZ /d %InstPath% /f
echo [42m[Info][0m Getting install list...
:: Install List : 
:: Steam/
:: Tlauncher/
:: Roblox/
:: Git/
:: Github desktop/
:: VS Code/
:: VS 2022 Community Edition/
:: Python 3.10.11/
:: Python 3.12.4/
:: Scratch 3/
:: Notepad++/
:: BCUninstaller/
:: Geek Uninstaller free version/
:: Unity Hub/
:: Godot/
:: GameMaker/
:: Adobe Acrobat DC/
:: Adobe AE CS4-
:: Adobe AE 2021-
:: Adobe Illustrator 2020-
:: Adobe Photoshop 2020-
:: Autodesk 3ds Max 2022-
:: Blender/
:: Huorong Security/
:: Tailscale/
:: VLC media player/
:: FFMPEG
:: 剪影专业版
:: Cyberlink Power Director
:: Audacity
:: Krita
:: 7-Zip/
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

echo [42m[Info][0m Defining Download links...
:: uses exe installer to install
set L_steam=https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
set L_tlauncher=https://tlauncher.org/installer
set L_roblox=https://www.roblox.com/download/client?os=win
set L_7zip=https://7-zip.org/a/7z2406-x64.exe
set L_git=https://github.com/git-for-windows/git/releases/download/v2.45.2.windows.1/Git-2.45.2-64-bit.exe
set L_githubdesktop=https://central.github.com/deployments/desktop/desktop/latest/win32
set L_vscode=https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
set L_vs2022=https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&cid=3650:dd8e9dd13f2a816b462220cdac19980f
set L_py310=https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe
set L_py311=https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe
set L_scratch3=https://downloads.scratch.mit.edu/desktop/Scratch%20Setup.exe
set L_notepadpp=https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.8/npp.8.6.8.Installer.x64.exe
set L_BCU=https://github.com/Klocman/Bulk-Crap-Uninstaller/releases/download/v5.8/BCUninstaller_5.8_portable.zip
set L_geek=https://geekuninstaller.com/geek.zip
set L_unityhub=https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe
set L_godot=https://github.com/godotengine/godot/releases/download/4.2.2-stable/Godot_v4.2.2-stable_win64.exe.zip
set L_gamemaker=https://gamemaker.io/en/download/windows/monthly
set L_acrobat=https://get.adobe.com/reader/download?os=Windows+10&name=Reader+2024.002.20759+English+Windows%2864Bit%29&lang=en&nativeOs=Windows+10&accepted=mss%2Ccr&declined=&preInstalled=
set L_blender=https://www.blender.org/download/release/Blender4.1/blender-4.1.1-windows-x64.msi/
set L_huorong=https://www.huorong.cn/downloadfullv5.html?status=hrstat&src=2
set L_tailscale=https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe
set L_VLC=https://get.videolan.org/vlc/3.0.21/win32/vlc-3.0.21-win32.exe
set L_FFMPEG=https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z
set L_jianying=https://lf3-package.vlabstatic.com/obj/faceu-packages/installer/jianying_jianyingpro_0_1.2.7_installer.exe
set L_audacity=https://github.com/audacity/audacity/releases/download/Audacity-3.5.1/audacity-win-3.5.1-64bit.exe
set L_krita=https://download.kde.org/stable/krita/5.2.2/krita-x64-5.2.2-setup.exe
set L_zipgenius=https://zipgenius.it/en/downloads-2/
set L_anydesk=https://anydesk.com/en/downloads/thank-you?dv=win_exe
set L_teamviewer=https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe
set L_filezilla=https://download.filezilla-project.org/client/FileZilla_3.67.0_win64_sponsored2-setup.exe
set L_putty=https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
set L_chrome=http://dl.google.com/chrome/install/375.126/chrome_installer.exe
set L_firefox=https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US&_gl=1*1m43u8n*_ga*NTgzNTY2NTIyLjE3MTg0MzczMDc.*_ga_MQ7767QQQW*MTcxODQzNzMwNy4xLjAuMTcxODQzNzMwOC4wLjAuMA..
set L_operagx=https://www.opera.com/zh-cn/computer/thanks?ni=eapgx&os=windows&edition=GX-CN
set L_tor=https://www.torproject.org/dist/torbrowser/13.0.16/tor-browser-windows-x86_64-portable-13.0.16.exe
set L_whatsapp=
set L_wechat=https://dldir1v6.qq.com/weixin/Windows/WeChatSetup.exe
set L_translucenttb=https://github.com/TranslucentTB/TranslucentTB/releases/download/2024.1/TranslucentTB.appinstaller
set L_files=https://cdn.files.community/files/download/Files.Stable.exe
set L_rainmeter=https://github.com/rainmeter/rainmeter/releases/download/v4.5.18.3727/Rainmeter-4.5.18.exe
set L_moneroguiwallet=https://downloads.getmonero.org/gui/win64install
set L_qemu=https://qemu.weilnetz.de/w64/qemu-w64-setup-20240423.exe
set L_vmware=
set L_powertoys=https://github.com/microsoft/PowerToys/releases/download/v0.81.1/PowerToysSetup-0.81.1-x64.exe
set L_java8=
set L_icecreampdfsam=
set L_treesize=
set L_obs=
set L_wsl=
set L_utorrent=
set L_idm=
set L_bilibili=
set L_iobit=
set L_sdcardformatter=
set L_winaero=
set L_wireshark=
:: uses powershell to download
powershell Invoke-WebRequest

echo.
echo [42m[Info][0m setup done.
echo [42m[Info][0m running main menu...
timeout /t 1 /nobreak > nul
goto mainmenu

::           M  A  I  N     C  O  D  E           ::
:mainmenu
cls
mode con: cols=96 lines=18
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
mode con: cols=96 lines=18
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           =================================================
echo.
echo [42m[Info][0m Manual Install selected, confirm? [Y=Continue, n=Back]
choice /c yn /n /m "[Y/n] >  "
if %ERRORLEVEL%==0 goto BreakExit
if %ERRORLEVEL%==1 goto FullInstContinue
if %ERRORLEVEL%==2 goto mainmenu
if %ERRORLEVEL%==255 goto ErrExit

:FullInstContinue
cls
mode con: cols=96 lines=18
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           =================================================
echo.
echo [42m[Info][0m Install will start now.
cd /d %InstallerPath%
echo [42m[Info][0m Changed directory to installer dir.
echo [42m[Info][0m Installing Required tools...
echo [42m[Info][0m Download and Installing Chocolately using powershell
::powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
set retries=0

:7zipretrydown
set /A retries = retries + 1
if retries GTR 3 (goto couldnotfind7zipexec) else (goto continst7zip)
echo [42m[Info][0m Downloading 7-Zip using powershell
powershell Invoke-WebRequest -Uri %L_7zip% -OutFile %InstallerPath%/7zip.exe
echo [42m[Info][0m Verifying 7-zip installer
if exist 7zip.exe (goto continst7zip) else (goto missinginst7zip)
:continst7zip
echo [42m[Info][0m Installing 7-zip
7zip.exe /S /D="%InstallerPath%\7zip\"
goto InstGit
:missinginst7zip
echo [43m[WARNING][0m The installer could not be found. Retrying in 3 seconds.
timeout /t 3 > NUL
goto 7zipretrydown
:couldnotfind7zipexec
echo retries=%retries%
echo [41m[ERROR][0m Maximum retries hit! Maybe the file is not downloaded, the server is down or you don't have an internet connection!
echo [41m[ERROR][0m Please retry by reexecute this script!
pause
goto ErrExit
:InstGit
echo [42m[Info][0m Downloading Git using powershell
powershell Invoke-WebRequest -Uri %L_git% -OutFile %InstPath%/installer/git.exe
pause





::           E  X  I  T             ::

:CleanAndExit
echo [42m[Info][0m 

:ErrExit
echo [41m[ERROR][0m Error exit triggered! Cleaning files and exiting.
rmdir /s %InstPath%/installer
exit

:BreakExit
echo [42m[Info][0m Break exit triggered! Exiting...
exit

:CleanExit
echo.
echo [42m[Info][0m Thank you for using this tool, Bye!
timeout 1 > nul
exit