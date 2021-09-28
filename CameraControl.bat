@ECHO OFF
:choice
set /P c=[On=1/Off=2] Camera? 
if /I "%c%" EQU "On" goto :onCamera
if /I "%c%" EQU "1" goto :onCamera
if /I "%c%" EQU "Off" goto :offCamera
if /I "%c%" EQU "2" goto :offCamera
goto :choice

:onCamera
Powershell.exe -executionpolicy Unrestricted -command Enable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *Cam* -Class Camera -Status Error).InstanceId -confirm:$false
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam /t REG_SZ /v Value /d Allow /f
echo.
pause
exit

:offCamera
Powershell.exe -executionpolicy Unrestricted -command Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *Cam* -Class Camera -Status OK).InstanceId -confirm:$false
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam /t REG_SZ /v Value /d Deny /f
echo.
pause
exit