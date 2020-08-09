#SingleInstance Force
;
;@author u/HyakoV2
;
;For Run: https://github.com/HyakoV3/GTAV-Utility-Script#dependency
;For use: https://github.com/HyakoV3/GTAV-Utility-Script#commands
;
;-------------------VARIABLES-----------------
;--------------------START--------------------
ONE_SECOND = 1000 ;In Milliseconds, this is the equivalent of a second
DELAY_SUSPEND = 10 ;In Seconds, to calculate the delay of suspend
DELAY_NETWORK = 16 ;In Seconds, to calculate the delay of network
NETWORK_ADAPTER_NAME := "Ethernet"
;---------------------END---------------------

;--------------SHUTDOWN SECTION---------------
;--------------------START--------------------
Hotkey, ^!f1, Shutdown_Script
;---------------------END---------------------


;--------VERIFY ADMIN RUNNING SECTION---------
;--------------------START--------------------
if not A_IsAdmin
  Run *RunAs utility.ahk
;---------------------END---------------------


;TODO Network Disable and Enable, Thanks: u/CRlME and u/Efeler_Gibi
;----------------NETWORK SECTION--------------
;--------------------START--------------------

;Disable, wait 15 seconds, Enable
^f1::
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
sleep, ONE_SECOND * DELAY_NETWORK
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
return

;Disable network
^f2::
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
return	

;Enable network
^f3::
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
return
;---------------------END---------------------


;TODO Supend and Resume Process, Thanks: u/HyakoV2
;---------------SUSPEND SECTION---------------
;--------------------START--------------------

;Suspend Process, wait 12 secondes, Resume Process
^f5::
Run, pssuspend gta5,,hide
sleep, ONE_SECOND * DELAY_SUSPEND
Run, pssuspend -r gta5,,hide
return

;Suspend Process
^f6::
Run, pssuspend gta5,,hide
return

;Resume Process
^f7::
Run, pssuspend -r gta5,,hide
return
;---------------------END---------------------


;TODO Supend and Resume Process, Thanks: u/HyakoV2
;---------------MODULE SECTION----------------
;--------------------START--------------------
;
;EXEMPLE HOW TO CALL ANOTHER SCRIPT
;f10::
;RunWait, module\v3\ahk_farm.ahk 
;
;---------------------END---------------------


;--------------SHUTDOWN SECTION---------------
;--------------------START--------------------
Shutdown_Script:
ExitApp
Return
;---------------------END---------------------
