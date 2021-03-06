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
HALF_SECOND = 500 ;In Milliseconds, this is the equivalent of a half second 
DELAY_SUSPEND = 10 ;In Seconds, to calculate the delay of suspend 
DELAY_NETWORK = 16 ;In Seconds, to calculate the delay of network 
DELAY_AFK = 5 ;In Seconds, to calculate the delay of network
KEY_PRESS = 100 ;TODO Delay between the presses on keys
KEY_SEND = 140 ;TODO Time for each pressed key
NETWORK_ADAPTER_NAME := "Ethernet" 
;---------------------END--------------------- 

;---------------CONFIGS - START--------------- 
SetKeyDelay, KEY_SEND, KEY_PRESS
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
Hotkey, ^F9, A_F_K
Hotkey, ^F10, A_F_K_S
Hotkey, F3, F_L
Hotkey, F4, F_MMI
Hotkey, F5, F_MEC
Hotkey, F6, CANCEL_ANI

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

;TODO SUpend and Resume Process, Thanks: u/HyakoV2 & u/TDarkShadow
;------------SUSPEND SECTION - START----------

; Suspends a process which has the given pid value.
SuspendProcess(pid) {
     hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
     If (hProcess) {
          DllCall("ntdll.dll\NtSuspendProcess", "Int", hProcess)
          DllCall("CloseHandle", "Int", hProcess)
     }
  }
  Return

; Resumes a process which has the given pid value.
ResumeProcess(pid) {
     hProcess := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "Int", pid)
     If (hProcess) {
          DllCall("ntdll.dll\NtResumeProcess", "Int", hProcess)
          DllCall("CloseHandle", "Int", hProcess)
     }
  }
  Return

; Checks wether a process which has the given pid value is suspended (true) or not (false).
IsProcessSuspended(pid) {
     For thread in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Thread WHERE ProcessHandle = " pid)
     If (thread.ThreadWaitReason != 5)
     Return False
     Return True
  }
  Return

;Suspend Process, wait 10 secondes, Resume Process
P_S_W_R:
  Process, Exist, GTA5.exe
  pid := ErrorLevel
  If (!IsProcessSuspended(pid)) {
      SuspendProcess(pid)
  }
  Sleep, ONE_SECOND * DELAY_SUSPEND
  Process, Exist, GTA5.exe
  pid := ErrorLevel
  If (IsProcessSuspended(pid)) {
      ResumeProcess(pid)
  }
  Return

;Suspend Process
P_S:
  Process, Exist, GTA5.exe
  pid := ErrorLevel
  If (!IsProcessSuspended(pid)) {
      SuspendProcess(pid)
  }
  Return

;Resume Process
P_R:
  Process, Exist, GTA5.exe
  pid := ErrorLevel
  If (IsProcessSuspended(pid)) {
      ResumeProcess(pid)
  }
  Return
;---------------------END---------------------

;TODO Prevent AFK, Thanks: u/HyakoV2, Feature: u/VZucca
;------------SUSPEND SECTION - START----------

;Start AFK prevent
A_F_K:
  AFK_VER := True
  While (AFK_VER){
    Send {z 3}
		Sleep, ONE_SECOND * DELAY_AFK
  }
  Return

;Stop AFK prevent
A_F_K_S:
  AFK_VER := False
  Return
;---------------------END---------------------

;TODO Macros, Thanks u/HyakoV2
;------------MACRO SECTION - START----------

;Faster Lester
F_L:
  WinActivate, ahk_exe GTA5.exe
  Send {Up}
  Sleep, HALF_SECOND  
  Send {Up}
  Send {Right}
  Send {Enter}
  Send {Left 3} 
  Send {Enter}
  Return

;Faster Mors
F_MMI:
  WinActivate, ahk_exe GTA5.exe
  Send {Up}
  Sleep, HALF_SECOND
  Send {Up}
  Send {Right}
  Send {Enter}
  Send {Left 2}
  Send {Down}
  Send {Enter}
  Return

;Faster Mechanic
F_MEC:
  WinActivate, ahk_exe GTA5.exe
  Send {Up}
  Sleep, HALF_SECOND
  Send {Up}
  Send {Right}
  Send {Enter}
  Send {Left 2}
  Send {UP}
  Send {Enter}
  Return
  
;Cancel animation
CANCEL_ANI:
  WinActivate, ahk_exe GTA5.exe
  Send {Esc}
  Sleep, 100
  Send {E}
  Sleep, 300
  Send {Esc}
  Return
;---------------------END---------------------

;TODO SUpend and Resume Process, Thanks: u/HyakoV2
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
