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

cls
#include ScriptV1_IDT_clean
cls

@echo off
:: set window size
mode con: cols=120 lines=30
cls
title Initializing - Script V1 by Anothermeer
echo initializing... please wait...
echo [42m[Info][0m Enabled colorize info tag.
set IDKeyPart=%random%%random%%random%%random%
set IDKey=%IDKeyPart%%IDKeyPart%

:: set file location
reg query HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v FileLoc > nul
if %errorlevel% equ 0 (
  echo "[42m[Info][0m Key Exist, keeping file location"
) else (
  echo "[42m[Info][0m Key not exists, adding Value.."
  reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v FileLoc /t REG_SZ /d %cd% /f > nul
)

setlocal EnableDelayedExpansion
echo [42m[Info][0m Set variables.

:: get admin privelege
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

:: change back to script location
FOR /F "skip=2 tokens=2*" %%a in ('reg query "HKCU\Console\AnothermeerBatchScripts\ScriptV1" /v FileLoc') do set cmdloc=%%b
cd /d %cmdloc%
title Initializing - Script V1 by Anothermeer
:checkifisfirststart
::check
set checkkey=HKCU\Console\AnothermeerBatchScripts\ScriptV1\FirstSetupPassed
reg query %checkkey% > nul
if %ERRORLEVEL% == 0 goto checklang
if %ERRORLEVEL% == 1 goto setup

:setup
cls
mode con: cols=120 lines=30
title Setup - Script V1 by Anothermeer
call logo.bat
echo                           ==    First Setup    ==
echo                                  Step  1/2
echo.
echo Please select language.
echo [1] English
echo [2] Chinese
echo [E] Exit Program
choice /c 12e /n /m ">  "
if %ERRORLEVEL%==0 goto BreakExit
if %ERRORLEVEL%==1 goto EN_setinstpath
if %ERRORLEVEL%==2 goto setcninit
if %ERRORLEVEL%==3 goto CleanExit
if %ERRORLEVEL%==255 goto ErrExit
:: setcninit doesnt connect to anything now, if select the option, it will CRASH.

goto ErrExit

:EN_setinstpath
:reenter_instpath
cls
mode con: cols=120 lines=30
title Setup - Script V1 by Anothermeer
call logo.bat
echo                           ==    First Setup    ==
echo                                  Step  2/2
echo.
echo Please enter the location you wish to install to.
echo.
set /P InstPath="Path >  "
echo.
echo [42m[Info][0m Testing the folder is availible...
if exist %InstPath%\ (goto selfolavail_en) else (goto selfolnotavail_en)

:selfolnotavail_en
echo [41m[ERROR][0m Hey! Looks like the folder you choosed is not avalible or missing.
echo [41m[ERROR][0m Please reenter the path.
echo [46m[Instruction][0m Press any key to reenter.
pause > nul
goto reenter_instpath

:langnotfound
echo [41m[ERROR][0m Language not found. Using Setup to reconfigure the language.
goto setup

:checklang
for /f "tokens=2*" %%a in ('reg query %key% /v PreferedLang 2^>nul') do (
  set value=%%b
)
if "!value!" == "en" (goto ENINIT) else if "!value!" == "cn" (goto ) else (goto langnotfound)

:seteninit
set lang=en
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v FirstSetupPassed /t REG_SZ /d 1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v PreferedLang /t REG_SZ /d en /f
title Initializing - Script V1 by Anothermeer
echo [42m[Info][0m Get admin privelege.
mode con: cols=120 lines=30
echo [42m[Info][0m Setting up...

:: select install folder

:selfolavail_en
cls
echo [42m[Info][0m Good news! The folder choosen is availible!
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









:continit
echo [42m[Info][0m Getting OS info...
systeminfo | findstr "OS\ Name" | findstr /v Connection | findstr /v Host > %temp%\ScriptV1\OSName.txt
set /p os=< %temp%\ScriptV1\OSName.txt
del %temp%\ScriptV1\OSName.txt
echo [42m[Info][0m Setting registry...
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v ScriptVersion /t REG_SZ /d 1.0.1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v IdentityKey /t REG_SZ /d %IDKey% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v OSName /t REG_SZ /d %OSName% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v InstallerPath /t REG_SZ /d %InstallerPath% /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v InstPath /t REG_SZ /d %InstPath% /f
echo [42m[Info][0m Getting install list...

:: See instapps.txt for list
:: Total apps : 56
:: Apps using download link to download : 54
:: Apps using command to download       : 2

echo [42m[Info][0m Defining Download links...
:: uses exe installer to install
set L_steam="https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
set L_tlauncher="https://tlauncher.org/installer"
set L_roblox="https://www.roblox.com/download/client?os=win"
set L_7zip="https://7-zip.org/a/7z2406-x64.exe"
set L_git="https://github.com/git-for-windows/git/releases/download/v2.45.2.windows.1/Git-2.45.2-64-bit.exe"
set L_githubdesktop="https://central.github.com/deployments/desktop/desktop/latest/win32"
set L_vscode="https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
set L_vs2022="https://c2rsetup.officeapps.live.com/c2r/downloadVS.aspx?sku=community&channel=Release&version=VS2022&cid=3650:dd8e9dd13f2a816b462220cdac19980f"
set L_py310="https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe"
set L_py311="https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe"
set L_scratch3="https://downloads.scratch.mit.edu/desktop/Scratch%20Setup.exe"
set L_notepadpp="https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.8/npp.8.6.8.Installer.x64.exe"
set L_BCU="https://github.com/Klocman/Bulk-Crap-Uninstaller/releases/download/v5.8/BCUninstaller_5.8_portable.zip"
set L_geek="https://geekuninstaller.com/geek.zip"
set L_unityhub="https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe"
set L_godot="https://github.com/godotengine/godot/releases/download/4.2.2-stable/Godot_v4.2.2-stable_win64.exe.zip"
set L_gamemaker="https://gamemaker.io/en/download/windows/monthly"
set L_acrobat="https://get.adobe.com/reader/download?os=Windows+10&name=Reader+2024.002.20759+English+Windows%2864Bit%29&lang=en&nativeOs=Windows+10&accepted=mss%2Ccr&declined=&preInstalled="
set L_blender="https://www.blender.org/download/release/Blender4.1/blender-4.1.1-windows-x64.msi/"
set L_huorong="https://www.huorong.cn/downloadfullv5.html?status=hrstat&src=2"
set L_tailscale="https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe"
set L_VLC="https://get.videolan.org/vlc/3.0.21/win32/vlc-3.0.21-win32.exe"
set L_FFMPEG="https://www.gyan.dev/ffmpeg/builds/ffmpeg-git-full.7z"
set L_jianying="https://lf3-package.vlabstatic.com/obj/faceu-packages/installer/jianying_jianyingpro_0_1.2.7_installer.exe"
set L_audacity="https://github.com/audacity/audacity/releases/download/Audacity-3.5.1/audacity-win-3.5.1-64bit.exe"
set L_krita="https://download.kde.org/stable/krita/5.2.2/krita-x64-5.2.2-setup.exe"
set L_zipgenius="https://zipgenius.it/en/downloads-2/"
set L_anydesk="https://anydesk.com/en/downloads/thank-you?dv=win_exe"
set L_teamviewer="https://download.teamviewer.com/download/TeamViewer_Setup_x64.exe"
set L_filezilla="https://download.filezilla-project.org/client/FileZilla_3.67.0_win64_sponsored2-setup.exe"
set L_putty="https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html"
set L_chrome="http://dl.google.com/chrome/install/375.126/chrome_installer.exe"
set L_firefox="https://download-installer.cdn.mozilla.net/pub/firefox/releases/127.0.2/win64/en-US/Firefox%20Setup%20127.0.2.exe"
set L_operagx="https://www.opera.com/zh-cn/computer/thanks?ni=eapgx&os=windows&edition=GX-CN"
set L_tor="https://www.torproject.org/dist/torbrowser/13.0.16/tor-browser-windows-x86_64-portable-13.0.16.exe"
set L_wechat="https://dldir1v6.qq.com/weixin/Windows/WeChatSetup.exe"
set L_files="https://cdn.files.community/files/download/Files.Stable.exe"
set L_rainmeter="https://github.com/rainmeter/rainmeter/releases/download/v4.5.18.3727/Rainmeter-4.5.18.exe"
set L_moneroguiwallet="https://downloads.getmonero.org/gui/monero-gui-install-win-x64-v0.18.3.3.exe"
set L_qemu="https://qemu.weilnetz.de/w64/qemu-w64-setup-20240423.exe"
set L_virtualbox="https://download.virtualbox.org/virtualbox/7.0.18/VirtualBox-7.0.18-162988-Win.exe"
set L_powertoys="https://github.com/microsoft/PowerToys/releases/download/v0.81.1/PowerToysSetup-0.81.1-x64.exe"
set L_java8="https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249833_43d62d619be4e416215729597d70b8ac"
set L_icecreampdfsam="https://icecreamapps.com/download/pdf_split_and_merge_setup.exe"
set L_treesize="https://customers.jam-software.de/downloadTrial.php?language=EN&article_no=80"
set L_obs="https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.1.2-Full-Installer-x64.exe"
set L_utorrent="https://www.utorrent.com/web/downloads/complete/track/stable/os/win/"
set L_idm="https://mirror2.internetdownloadmanager.com/idman642build12.exe?v=lt&filename=idman642build12.exe"
set L_bilibili="https://dl.hdslb.com/mobile/fixed/bili_win/bili_win-install.exe?v=1.14.0"
set L_iobituninst="https://www.iobit.com/en/advanceduninstaller.php#"
set L_sdcardformatter="https://www.sdcard.org/downloads/formatter/eula_windows/SDCardFormatterv5_WinEN.zip"
set L_winaero="https://winaerotweaker.com/download/"
set L_wireshark="https://2.na.dl.wireshark.org/win64/Wireshark-4.2.5-x64.exe"
:: uses appinstaller to install
set L_translucenttb="https://github.com/TranslucentTB/TranslucentTB/releases/download/2024.1/TranslucentTB.appinstaller"
set L_whatsapp=a
set L_wsl=a

echo.
echo [42m[Info][0m setup done.
echo [42m[Info][0m running main menu...
timeout /t 1 /nobreak > nul
echo [42m[Info] ==== INITIALIZE COMPLETE! ====[0m
pause


::           M  A  I  N     C  O  D  E           ::

:mainmenu_en
cls
mode con: cols=120 lines=30
chcp 437 > nul
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
echo           l   5. Change to Chinese                        l
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
if %ERRORLEVEL%==5 goto CNMenu
if %ERRORLEVEL%==6 goto CleanExit
if %ERRORLEVEL%==255 goto ErrExit

:: FullInst : Working
:: ManInst  : Not Yet implement
:: RegTweak : Not Yet implement
:: ListInfo : Not Yet implement
:: CNMenu   : Not Yet implement

:FullInst
cls
mode con: cols=120 lines=30
echo           =================================================
echo           l         + Script V1 by Anothermeer +          l
echo           =================================================
echo.
echo [42m[Info][0m Full Install selected, confirm? [Y=Continue, n=Back]
choice /c yn /n /m "[Y/n] >  "
if %ERRORLEVEL%==0 goto BreakExit
if %ERRORLEVEL%==1 goto FullInstContinue
if %ERRORLEVEL%==2 goto mainmenu
if %ERRORLEVEL%==255 goto ErrExit

:FullInstContinue
cls
mode con: cols=120 lines=30
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

:seteninit
set lang=en
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v FirstSetupPassed /t REG_SZ /d 1 /f
reg add HKCU\Console\AnothermeerBatchScripts\ScriptV1 /v PreferedLang /t REG_SZ /d en /f
title Initializing - Script V1 by Anothermeer
echo [42m[Info][0m Get admin privelege.
mode con: cols=120 lines=30
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


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                 ::
::          C   H   I   N   E   S   E       M   E   N   U          ::
::                                                                 ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::     working on english, then translate to Chinese
::     REMEMBER TO USE CHCP!!!




::           E  X  I  T             ::

:CleanAndExit
echo [42m[Info][0m Still in Progress...
pause
pause
pause
exit

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