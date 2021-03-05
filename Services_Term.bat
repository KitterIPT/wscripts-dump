@ECHO OFF
net stop GarenaPlatform
sc config GarenaPlatform start=disabled

net stop UsoSvc
sc config UsoSvc start=disabled

net stop wuauserv
sc config wuauserv start=disabled

net stop WaaSMedicSvc
sc config WaaSMedicSvc start=disabled

net stop msiserver
sc config msiserver start=disabled

TIMEOUT 5
exit