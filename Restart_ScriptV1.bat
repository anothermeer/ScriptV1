@echo off
title ScriptV1 Cleaner
echo ScriptV1 Internal debug tool - ScriptV1 Cleaner
echo.
set /p instpath="Please enter the path of the installation folder > "
echo.
echo Starting cleaning...

echo Cleaning File System...
:: temp folder cleaning
if exist %tmp%\ScriptV1 (goto deltmp) else (goto tmpnotfound)
:deltmp
del /f /q /a %tmp%\ScriptV1
echo Deleted temp
goto continue
:tmpnotfound
echo temp not found, skiped.

:: installation folder cleaning
:continue
echo Cleaning Installation Folder
if exist %instpath% (goto delinstfol) else (goto instfolnotfound)
:delinstfol
del /f /q /a %instpath%
echo Deleted Installation Folder
goto continue2
:instfolnotfound
echo installation folder not found, skipped.

:: registry cleaning
:continue2
echo Cleaning Registry...
reg delete HKCU\Console\AnothermeerBatchScripts /f
echo.

echo Cleaning done! Press any key to exit.
pause > nul