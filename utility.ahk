#SingleInstance Force
;
;@author u/HyakoV2
;
;For run: https://github.com/HyakoV3/GTAV-Utility-Script#dependency
;For use: https://github.com/HyakoV3/GTAV-Utility-Script#commands
;
;-------------------VARIABLES-----------------
;--------------------START--------------------
ONE_SECOND = 1000 ;In Milliseconds, this is the equivalent of a second
DELAY_SUSPEND = 10 ;In Seconds, to calculate the delay of suspend
DELAY_NETWORK = 16 ;In Seconds, to calculate the delay of network
NETWORK_ADAPTER_NAME := "Ethernet"
;---------------------END---------------------

;-----------------MENU SECTION----------------
;--------------------START--------------------
Hotkey, ^!F1, shutdownScript
;-----------------------
Hotkey, ^F1, networkDisableWaitEnable
Hotkey, ^F2, networkDisable
Hotkey, ^F3, networkEnable
Hotkey, ^F5, suspendProcessWaitResume
Hotkey, ^F6, suspendProcess
Hotkey, ^F7, resumeProcess
Hotkey, F9, startModeule01
;Hotkey, F10, startModeule02
;Hotkey, F11, startModeule03
;---------------------END---------------------

;--------VERIFY ADMIN RUNNING SECTION---------
;--------------------START--------------------
if not A_IsAdmin
  Run *RunAs utility.ahk
  Return
;---------------------END---------------------


;TODO Network Disable and Enable, Thanks: u/CRlME and u/Efeler_Gibi
;----------------NETWORK SECTION--------------
;--------------------START--------------------

;Disable, wait 15 seconds, Enable
networkDisableWaitEnable:
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
Sleep, ONE_SECOND * DELAY_NETWORK
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
Return

;Disable network
networkDisable:
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
Return	

;Enable network
networkEnable:
Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
Return
;---------------------END---------------------

;TODO Supend and Resume Process, Thanks: u/HyakoV2
;---------------SUSPEND SECTION---------------
;--------------------START--------------------

;Suspend Process, wait 12 secondes, Resume Process
suspendProcessWaitResume:
Run, pssuspend gta5,,hide
Sleep, ONE_SECOND * DELAY_SUSPEND
Run, pssuspend -r gta5,,hide
Return

;Suspend Process
suspendProcess:
Run, pssuspend gta5,,hide
Return

;Resume Process
resumeProcess:
Run, pssuspend -r gta5,,hide
Return
;---------------------END---------------------

;TODO Supend and Resume Process, Thanks: u/HyakoV2
;---------------MODULE SECTION----------------
;--------------------START--------------------
;
;EXEMPLE HOW TO CALL ANOTHER SCRIPT
;startModeule01:
;RunWait, module\v3\ahk_farm.ahk
;
;---------------------END---------------------

;--------------SHUTDOWN SECTION---------------
;--------------------START--------------------
shutdownScript:
ExitApp
Return
;---------------------END---------------------
