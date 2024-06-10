@echo off
systeminfo | findstr "OS\ Name" | findstr /v Connection | findstr /v Host > OSName.txt
set /p os=< OSName.txt
echo %os%
del OSName.txt
pause