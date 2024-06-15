@echo off
echo.
echo Selection time!
echo.
echo 1. My father is Joe
echo 2. My mother is Audrey
echo 3. My brother is Jerry
echo 4. My elder sister is June
echo 5. My youngest sister is Awy
echo 6. Include All
echo.

:getOptions
set "choices="
set /p "choices=Type your choices without spacing (e.g. 1,2,3): "

if not defined choices ( 
    echo Please enter a valid option
    goto getOptions
    )

for %%a in (%choices%) do if %%a EQU 6 set choices=1,2,3,4,5
for %%i in (%choices%) do call :option-%%i

echo.
echo Done
pause
exit

:option-1
>> Family.txt echo My father is Joe
exit /B

:option-2
>> Family.txt echo My mother is Audrey
exit /B

:option-3
>> Family.txt echo My brother is Jerry
exit /B

:option-4
>> Family.txt echo My elder sister is June
exit /B

:option-5
>> Family.txt echo My youngest sister is Awy
exit /B