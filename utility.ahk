#SingleInstance Force 
; 
;@author u/HyakoV2 
; 
;For run: https://github.com/HyakoV3/GTAV-Utility-Script#dependency 
;For use: https://github.com/HyakoV3/GTAV-Utility-Script#commands 
; 
;-----VERIFY ADMIN RUNNING SECTION - START---- 
if not A_IsAdmin 
  Run *RunAs utility.ahk 
;---------------------END--------------------- 

;--------------VARIABLES - START-------------- 
ONE_SECOND = 1000 ;In Milliseconds, this is the equivalent of a second 
DELAY_SUSPEND = 10 ;In Seconds, to calculate the delay of suspend 
DELAY_NETWORK = 16 ;In Seconds, to calculate the delay of network 
NETWORK_ADAPTER_NAME := "Ethernet" 
;---------------------END--------------------- 

;------------MENU SECTION - START------------- 
Hotkey, ^!F1, shutdownScript 
;----------------------- 
Hotkey, ^F1, N_D_W_E 
Hotkey, ^F2, N_D 
Hotkey, ^F3, N_E 
Hotkey, ^F5, P_S_W_R 
Hotkey, ^F6, P_S 
Hotkey, ^F7, P_R 
;----------------------- 
;Hotkey, F9, startModeule01 
;Hotkey, F10, startModeule02 
;Hotkey, F11, startModeule03 
;----------------------- 
Return 
;---------------------END---------------------

;TODO Network Disable and Enable, Thanks: u/CRlME and u/Efeler_Gibi
;---------NETWORK SECTION - START-------------

;Disable, wait 16 seconds, Enable
N_D_W_E:
  Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
  Sleep, ONE_SECOND * DELAY_NETWORK
  Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
  Return

;Disable network
N_D:
  Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=disabled,,hide
  Return	

;Enable network
N_E:
  Run, *RunAs %comspec% /c netsh interface set interface name="%NETWORK_ADAPTER_NAME%" admin=enabled,,hide
  Return
;---------------------END---------------------

;TODO Supend and Resume Process, Thanks: u/HyakoV2
;------------SUSPEND SECTION - START----------

;Suspend Process, wait 10 secondes, Resume Process
P_S_W_R:
  Run, pssuspend gta5,,hide
  Sleep, ONE_SECOND * DELAY_SUSPEND
  Run, pssuspend -r gta5,,hide
  Return

;Suspend Process
P_S:
  Run, pssuspend gta5,,hide
  Return

;Resume Process
P_R:
  Run, pssuspend -r gta5,,hide
  Return
;---------------------END---------------------

;TODO Supend and Resume Process, Thanks: u/HyakoV2
;----------MODULE SECTION - START-------------
;
;EXEMPLE HOW TO CALL ANOTHER SCRIPT
;startModeule01:
;RunWait, module\v3\ahk_farm.ahk
;
;---------------------END---------------------

;---------SHUTDOWN SECTION - START------------
shutdownScript:
  ExitApp
;---------------------END---------------------
