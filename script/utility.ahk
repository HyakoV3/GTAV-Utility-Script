#Persistent
;
;@author u/HyakoV2
;@author u/Zucca
;
;Download Pstools from: https://docs.microsoft.com/en-us/sysinternals/downloads/pstools
;Extract from the archive the files pssuspend.exe and pssuspend64.exe into the C:\Windows\

;===================VARIABLES=================
;====================START====================
DELAY_SUSPEND = 10000
DELAY_NETWORK = 15000
NETWORK_ADAPTER_NAME := "Ethernet"
;=====================END=====================

;==============SHUTDOWN SECTION===============
;====================START====================
Hotkey, ^!f1, Shutdown_Script


;TODO Network Disable and Enable, Thanks: u/CRlME and u/Efeler_Gibi
;================NETWORK SECTION==============
;====================START====================

;Disable, wait 15 seconds, Enable
^f2::
run, *runas %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
sleep, %DELAY_NETWORK%
run, *runas %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
return

;Disable network
^f3::
run, *runas %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
return	

;Enable network
^f4::
run, *runas %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
return
;=====================END=====================

;TODO Supend and Resume Process, Thanks: u/HyakoV2
;===============SUSPEND SECTION===============
;====================START====================

;Suspend Process, wait 12 secondes, Resume Process
^f5::
run, pssuspend gta5,,hide
sleep, %DELAY_SUSPEND%
run, pssuspend -r gta5,,hide
return

;Suspend Process
^f6::
run, pssuspend gta5,,hide
return

;Resume Process
^f7::
run, pssuspend -r gta5,,hide
return
;=====================END=====================


Shutdown_Script:
ExitApp
Return
;=====================END=====================
