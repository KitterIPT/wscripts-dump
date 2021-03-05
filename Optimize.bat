rmdir /s C:\Windows\Temp

rmdir /s C:\Users\vuvan\AppData\Local\Temp

@ECHO OFF
echo.
echo.
:choice
set /P c=Start Your Uninstaller[Y/N]?
if /I "%c%" EQU "Y" goto :YU7
if /I "%c%" EQU "N" goto :2nd_choice
goto :choice

:2nd_choice
set /P c=Start Smart Defrag[Y/N]?
if /I "%c%" EQU "Y" goto :SD
if /I "%c%" EQU "N" goto :3rd_choice

:3rd_choice
set /P c=Start Window Defender FullScan[Y/N]?
if /I "%c%" EQU "Y" goto :WD
if /I "%c%" EQU "N" exit

:YU7
cd C:\Program Files (x86)\Your Uninstaller! 7
start urmain.exe
goto :2nd_choice

:SD
cd C:\Program Files (x86)\IObit\Smart Defrag
start SmartDefrag.exe
goto :3rd_choice

:WD
cd C:\Program Files\Windows Defender
MpCmdRun.exe -scan -2
pause
exit