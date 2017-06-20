; https://www.google.com/search?q=shell32.dll+icon+numbers
; Menu, Tray, Icon, %windir%\system32\wiashext.dll, 18 ; msdos
; Menu, Tray, Icon, %windir%\system32\pifmgr.dll, 7 ; trumpet
; Menu, Tray, Icon, %windir%\system32\netshell.dll, 29 ; cloud
Menu, Tray, Icon, %windir%\system32\compstui.dll, 84 ; rotaryphone

; Control key  ^
; Alt key      !
; Shift key    +
; Windows key  # 

;Allows for the script to be reloaded everytime it's saved
SetTimer,UPDATEDSCRIPT,1000
SetTimer, RegularMaintenance, 60000
SetTimer, RegularMaintenance, -1

UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
FileSetAttrib,-A,%A_ScriptFullPath%
Sleep,500
Reload
}
Return 

RegularMaintenance:
FileDelete, C:\Users\Public\Desktop\*.url
FileDelete, C:\Users\Public\Desktop\*.lnk
; Set lid close to Do Nothing for both AC and DC -- http://superuser.com/a/874858/6926
Run powercfg "-SETACVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0",,Hide
Run powercfg "-SETDCVALUEINDEX 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0",,Hide
Run, %comspec% /c "taskkill /F /IM Receiver.exe /T",,Hide
Return




;=============================
;RESHARPER
;=============================

capslock & n:: send, !`` ;Caps-N => Alt-`: Resharper's "Navigate to" menu
capslock & g:: send, !{insert} ;Caps-G => Alt-Insert: Resharper's "Generate" code menu
$!j:: send, !{down} ;Alt-J => Alt-Down: Resharper's "Goto Next Method"
$!k:: send, !{up} ;Alt-K => Alt-Up: Resharper's "Goto Previous Method"
$^+!k:: send, ^+!{up} ;Ctrl-Shift-Alt-K => Ctrl-Shift-Alt-Up: Resharper's "Move Up"
$^+!j:: send, ^+!{down} ;Ctrl-Shift-Alt-J => Ctrl-Shift-Alt-Down: Resharper's "Move Down"
$+!j:: send, $+!{pgdown} ;Shift-Alt-J => Shift-Alt-PgDn: Resharper's "Goto Next Error In Solution"
$+!k:: send, $+!{pgup} ;Shift-Alt-K => Shift-Alt-PgUp: Resharper's "Goto Previous Error In Solution"
capslock & s:: send, ^!{right} ;Caps-S => Ctrl-Alt-Right: Resharper's "Extend Selection"

capslock & u::
GetKeyState, state, shift, P
if state = D 
send, +!{F11} ;Shift-Caps-U => Shift-Alt-F11: Resharper's "Highlight Usages"
else
send, +!{F12} ;Caps-U => Shift-Alt-F12: Resharper's "Goto Usage"
return

$^!J:: Send, ^!{PgDn} ;Ctrl-Alt-J => Ctrl-Alt-PgDn: Resharper's "Goto Next Occurence"
$^!K:: Send, ^!{PgUp} ;Ctrl-Alt-K => Ctrl-Alt-PgUp: Resharper's "Goto Previous Occurence"
capslock & i:: send, ^+!a ;Caps-I => Ctrl-Shift-Alt-A: Resharper's "Inspect This"

;=============================
;VISUAL STUDIO
;=============================

capslock & ':: ; Caps-' => Move mouse out of the way (to top of window)
WinGetPos, X, Y, , , A
mousegetpos ,currentx, currenty
mousemove, a_caretx, 10
keywait, capslock
keywait, capslock
return 

capslock & o:: send, ^- ;Caps-O => Ctrl-dash: Visual Studio's "Navigation Backward"
capslock & m:: Send, ^!{down} ;Caps-M => Ctrl-Alt-M: Visual Studio's "Show MDI File List"
capslock & Backspace:: send, ^{Break} ;Caps-Backspace => Ctrl-Break: Visual Studio's "Cancel Build"

;navigate to next find result (or error, if holding shift)
capslock & r:: 
GetKeyState, state, shift, P
if state = D 
send, ^+{F12} ;Caps-Shift-R => Ctrl-Shift-F12: Visual Studio's "View Next Error"
else
send, ^+!n ;Caps-R => Ctrl-Shift-Alt-N: Visual Studio's "Goto Find Results 1 Next Location" (this command has no keyboard shortcut in Visual Studio by default and must be configured accordingly first)
return

capslock & b::
GetKeyState, altState, alt, P
if altState = D
	send, !{PgUp} ;Caps-Shift-B => Alt-PgUp: Resharper's "Goto Previous Highlight"
else
	send, {PgUp} ;Caps-B => PgUp
return

capslock & f::
GetKeyState, altState, alt, P
if altState = D
	send, !{PgDn} ;Caps-Shift-F => Alt-PgDn: Resharper's "Goto Next Highlight"
else
	send, {PgDn} ;Caps-F => PgDn
return

;=============================
;STANDARD KEY MAPPINGS
;=============================

capslock & `;:: send, {Appskey} ;Caps-Semicolon => AppsKey: create an apps key for keyboards w/o one

capslock & 4::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if spaceState = D
	send, +{End} ;Caps-Space-4 => Shift-End
else
	if shiftState = D
		send, ^{End} ;Caps-Shift-4 => Ctrl-End
	else
		send, {End} ;Caps-4 => End
return

capslock & 6::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if spaceState = D
	send, +{Home} ;Caps-Space-6 => Shift-Home
else
	if shiftState = D
		send, ^{Home} ;Caps-Shift-6 => Ctrl-Home
	else
		send, {Home} ;Caps-6 => Home
return

capslock & 1::send, {Insert} ;Caps-1 => Insert

capslock & e:: 
GetKeyState, shiftState, shift, P
if shiftState = D 
send, {shift}+{escape} ;Shift-Caps-E => Shift-Escape
else
send, {escape} ;Caps-E => Escape
return

capslock & x::send, {delete} ;Caps-X => Delete

capslock & k::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if shiftState = D 
	send, ^{up} ;Shift-Caps-K => Ctrl-Up
else
	if spaceState = D
		send, +{up} ;Caps-Space-K => Shift-Up
	else
		send, {up} ;Caps-K => Up
return

capslock & j::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if shiftState = D 
	send, ^{down} ;Shift-Caps-J => Ctrl-Down
else
	if spaceState = D
		send, +{down} ;Caps-Space-J => Shift-Down
	else
		send, {down} ;Caps-J => Down
return

capslock & h::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if shiftState = D 
	if spaceState = D
		send, +^{left} ;Shift-Caps-Space-H => Ctrl-Shift-Left
	else
		send, ^{left} ;Shift-Caps-H => Ctrl-Left
else
	if spaceState = D
		send, +{left} ;Caps-Space-H => Shift-Left
	else
		send, {left} ;Caps-H => Left
return

capslock & l::
GetKeyState, shiftState, shift, P
GetKeyState, spaceState, space, P
if shiftState = D 
	if spaceState = D
		send, +^{right} ;Shift-Caps-Space-L => Ctrl-Shift-Right
	else
		send, ^{right} ;Shift-Caps-L => Ctrl-Right
else
	if spaceState = D
		send, +{right} ;Caps-H => Caps-Space-L => Shift-Right
	else
		send, {right} ;Caps-H => Right
return

capslock & t:: AltTab ;Caps-T => Alt-Tab
capslock & d:: ShiftAltTab ;Caps-D => Shift-Alt-Tab

capslock & c::
GetKeyState, shiftState, shift, P
if shiftState = D 
	send !{F4} ;Shift-Caps-C => Alt-F4
else
	send, ^{F4} ;Caps-C => Ctrl-F4
return

;Stop capslock & key from toggling capslock.
*capslock::
capslock & down:: 
capslock & up::
capslock & right::
capslock & left::
capslock & appskey::
capslock & tab::
capslock & `::
capslock & 3:: 
capslock & 5::
capslock & 7::
capslock & 8::
capslock & 9::
capslock & 0::
capslock & -::
capslock & =::
capslock & y::
capslock & a::
capslock & \::
capslock & z::
capslock & v::
capslock & p:: 
capslock & ,::
capslock & .::
capslock & space::
capslock & enter::
capslock & w::
capslock & [::
capslock & ]::
capslock & #::

CapsLock::Return
+CapsLock::CapsLock

;=============================
; WinKey+M: Turn off monitor
;=============================
#M::
TrayTip , Turn Off Monitor, Turning off monitor in 1 minute..., 60, 1
Sleep, 60000 ; so this very keystroke doesn't wake monitor back up
SendMessage,0x112,0xF170,2,,Program Manager
return