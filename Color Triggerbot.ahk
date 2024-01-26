#NoEnv 
#SingleInstance, Force
#Persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen
SoundBeep, 300, 200
SoundBeep, 400, 200
 
;===================================================================================
 
 
;CHANGE IF YOU NEED TO CHANGE, only change keybinds within the "" and you must ensure the "" do not move.
;SETTINGS CAN BE CHANGES TOO, consult with felis to ensure that your settings will work.
 
;HOTKEYS & MODES
key_stay_on	:= 	"F1"		; Always On and Auto Shoot	
key_hold_mode	:= 	"F2"		; Triggerbot will only scan if "key_hold" is pressed
key_fastclick 	:= 	"F3"		; Just extra rapid fire/auto clicker (on/off beep sound only)
key_not_move_on 	:= 	"F4"         ; Triggerbot will auto scan and movement key not pressed
key_not_move_hold 	:= 	"F5"         ; ; Triggerbot will only scan if "key_hold" is pressed and movement key not pressed
key_off		:= 	"F6"		; Triggerbot turn off
key_gui_hide	:=	"DEL"		; hides gui (gui)		
key_exit	:= 	"HOME"		; Triggerbot script exit	
key_hold	:=	"LShift" 		; key that you hold to shoot for you	
 
;SETTINGS
pixel_box	:=	1	; MIN- 3      MAX- 8	
pixel_sens	:=  100		; Higher Number = more color sensitive; Less Number = less color sensitive 		
pixel_color	:=	0x79F8FB 	; Pixel Color
tap_time	:=	1		; Delay in MS between shots
scan_time   :=  100 ; Delay in MS between pixel scanning
 
 
;===================================================================================
 
 
;===================================================================================
 
 
;DO NOT TOUCH
Gui,2:Font,Cdefault,Fixedsys
Gui,2:Color,Black
Gui,2:Color, EEAA99
Gui,2:Add,Progress, x10 y20 w150 h23 Disabled BackgroundRed vC6
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB6 gStart, OFF
Gui,2:Add,Progress, x10 y20 w150 h23 Disabled BackgroundLime vC5
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB5 gStart,STOP@SHOOT[HOLD]
Gui,2:Add,Progress, x10 y20 w150 h23 Disabled BackgroundLime vC4
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB4 gStart,STOP@SHOOT[ON]
Gui,2:Add,Progress, x10 y20 w150 h23 Disabled BackgroundLime vC3
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB3 gStart,ALWAYS ON
Gui,2:Add,Progress, x10 y20 w150 h23 Disabled BackgroundLime vC2
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB2 gStart,HOLD MODE
Gui,2:Add,Progress, xp yp wp hp Disabled BackgroundFuschsia vC1
Gui,2:Add,Text, xp yp wp hp cWhite BackgroundTrans Center 0x200 vB1 gStart,Azim Triggerbot
Gui,2: Show, x10 y1 w200 h60
Gui 2:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99

2Guiescape:
2Guiclose:
leftbound:= A_ScreenWidth/2-pixel_box
rightbound:= A_ScreenWidth/2+pixel_box
topbound:= A_ScreenHeight/2-pixel_box
bottombound:= A_ScreenHeight/2+pixel_box 

hotkey, %key_stay_on%, stayon
hotkey, %key_hold_mode%, holdmode
hotkey, %key_not_move_on%, notmoveon
hotkey, %key_not_move_hold%, notmovehold
hotkey, %key_off%, offloop
hotkey, %key_gui_hide%, guihide
hotkey, %key_exit%, terminate
Hotkey, %key_fastclick%, fastclick
return

start:
gui,2:submit,nohide
terminate:
SoundBeep, 300, 200
SoundBeep, 200, 200
Sleep 400
exitapp

stayon:
SoundBeep, 300, 200
settimer, loop4, off
settimer, loop3, off
settimer, loop2, off
settimer, loop1, %scan_time%
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B3
GuiControl,2: show,C3
GuiControl,2: hide,B4
GuiControl,2: hide,C4
GuiControl,2: hide,B5
GuiControl,2: hide,C5
GuiControl,2: hide,B6
GuiControl,2: hide,C6
return

holdmode:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, %scan_time%
settimer, loop3, off
settimer, loop4, off
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: show,B2
GuiControl,2: show,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4
GuiControl,2: hide,C4
GuiControl,2: hide,B5
GuiControl,2: hide,C5
GuiControl,2: hide,B6
GuiControl,2: hide,C6
return

notmoveon:
SoundBeep, 300, 200
settimer, loop4, off
settimer, loop3, %scan_time%
settimer, loop2, off
settimer, loop1, off
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: show,B4
GuiControl,2: show,C4
GuiControl,2: hide,B5
GuiControl,2: hide,C5
GuiControl,2: hide,B6
GuiControl,2: hide,C6
return

notmovehold:
SoundBeep, 300, 200
settimer, loop4, %scan_time%
settimer, loop3, off
settimer, loop2, off
settimer, loop1, off
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4
GuiControl,2: hide,C4
GuiControl,2: show,B5
GuiControl,2: show,C5
GuiControl,2: hide,B6
GuiControl,2: hide,C6
return

offloop:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, off
settimer, loop3, off
settimer, loop4, off
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4
GuiControl,2: hide,C4
GuiControl,2: hide,B5
GuiControl,2: hide,C5
GuiControl,2: show,B6
GuiControl,2: show,C6
return

guihide:
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
GuiControl,2: hide,B4
GuiControl,2: hide,C4
GuiControl,2: hide,B5
GuiControl,2: hide,C5
return
 
loop1:
PixelSearch()
return
 
loop2:
While GetKeyState(key_hold, "P")
{
PixelSearch()
}
return

loop3:
if (!GetKeyState("W") && !GetKeyState("A") && !GetKeyState("S") && !GetKeyState("D"))
{
PixelSearch()
}
return

loop4:
if (!GetKeyState("W") && !GetKeyState("A") && !GetKeyState("S") && !GetKeyState("D"))
While GetKeyState(key_hold, "P")
{
PixelSearch()
}
return

HideGui:
Gui, 2:Hide
return

GuiClose:
Exitapp
return
 
fastclick:
SoundBeep, 300, 200
toggle := !toggle
return
#if toggle
*~$LButton::
sleep 100
While GetKeyState("LButton", "P"){
Click
sleep 10
}
return
#if
 
PixelSearch() {
global
PixelSearch, FoundX, FoundY, leftbound, topbound, rightbound, bottombound, pixel_color, pixel_sens, Fast RGB
If !(ErrorLevel)
{
If !GetKeyState("LButton")
{
click
sleep %tap_time%
}
}
return
}