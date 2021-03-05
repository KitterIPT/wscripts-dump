@ECHO OFF
:choice
set /P c=[Start=1/Stop=2] VMWare Services? 
if /I "%c%" EQU "Start" goto :startVM
if /I "%c%" EQU "1" goto :startVM
if /I "%c%" EQU "Stop" goto :stopVM
if /I "%c%" EQU "2" goto :stopVM
goto :choice

:startVM
sc config VMAuthdService start=demand
sc config "VMware NAT Service" start=demand
sc config VMnetDHCP start=demand
sc config VMUSBArbService start=demand
sc config VMwareHostd start=demand

sc start VMAuthdService
sc start "VMware NAT Service"
sc start VMnetDHCP
sc start VMUSBArbService
sc start VMwareHostd
echo.
pause
exit

:stopVM
net stop VMAuthdService
net stop "VMware NAT Service"
net stop VMnetDHCP
net stop VMUSBArbService
net stop VMwareHostd

sc config VMAuthdService start=disabled
sc config "VMware NAT Service" start=disabled
sc config VMnetDHCP start=disabled
sc config VMUSBArbService start=disabled
sc config VMwareHostd start=disabled
echo.
pause
exit