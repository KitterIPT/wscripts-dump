@ECHO OFF
:choice
set /P c=[Start=1/Stop=2] PostgreSQL Services? 
if /I "%c%" EQU "Start" goto :startPSQL
if /I "%c%" EQU "1" goto :startPSQL
if /I "%c%" EQU "Stop" goto :stopPSQL
if /I "%c%" EQU "2" goto :stopPSQL
goto :choice

:startPSQL
sc config postgresql-x64-13 start=demand
sc start postgresql-x64-13
echo.
pause
exit

:stopPSQL
net stop postgresql-x64-13
sc config postgresql-x64-13 start=disabled
echo.
pause
exit