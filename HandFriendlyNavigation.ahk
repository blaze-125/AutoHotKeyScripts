/*
Use Caps Lock for Hand-Friendly Text Navigation
http://lifehacker.com/5277383/use-caps-lock-for-hand+friendly-text-navigation

Written by Philipp Otto, Germany, enhenced by Sylvain Dube, Quebec.

GetKeyState sample
GetKeyState, OutputVar, KeyName [P]hysical state or [T]oggle state(capslock, numlock, scrolllock,insert)



Script Function:
Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
    
    ATTENTION!!!!!
    ATTENTION!!!!!
    ATTENTION!!!!!
    If you really need your CapsLock key to behave normally again, go in the tray icons, right click the AutoHotkey icon and "Suspend Hotkeys".
    This script forces your Caps state to Off. This means that your CapsLock key will not give you CapsLock results for as long as this script will run. Although there are occasional glitches and CapsLock suddenly turns on. This does not happen very often.

    Normal usage with capslock as a modifier:
    j: move cursor left
    k: move cursor down
    l: move cursor right
    i: move cursor up
    h: simulates CTRL+left (jumps to the next word)
    ;: simulates CTRL+right (you may need to adjust the key that triggers this one based on your keyboard layout and language)
    ,: simulates CTRL+Down (to move within a textmove without moving the cursor)
    m: simulates CTRL+Up 
    u: simulates "Home" (jumps to the beginning of the current line)
    o: simulates "End"
    q: simulates Backspace
    Space: simulates Enter
    x: cut; simulates Ctrl+X (Commented out)
    c: copy; simulates Ctrl+C (Commented out)
    v: paste; simulates Ctrl+V (Commented out)
    Shift: If you keep pressing Shift in addition to Capslock you highlight the text.

    Mouse Movements
    w: move mouse pointer up
    s: move mouse pointer down
    a: move mouse pointer left
    d: move mouse pointer right
    you can combine keys to move in diagonal
    c: Mouse Click
    Alt: for a slower mouse movement. I could have picked Shift as the modifier key for mouse movements,
    but the Shift key didn't feel as natural as the Alt key. Espescially if you use the Left Alt with your thumb.


*/
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState, AlwaysOff

CapsLock & i::
       if getkeystate("shift") = 0
               Send,{Up}
       else
               Send,+{Up}
return

CapsLock & l::
       if getkeystate("shift") = 0
               Send,{Right}
       else
               Send,+{Right}
return

CapsLock & j::
       if getkeystate("shift") = 0
               Send,{Left}
       else
               Send,+{Left}
return

CapsLock & k::
       if getkeystate("shift") = 0
               Send,{Down}
       else
               Send,+{Down}
return

CapsLock & ,::Send,^{Down}
return

CapsLock & m::Send,^{Up}
return

CapsLock & u::
       if getkeystate("shift") = 0
               Send,{Home}
       else
               Send,+{Home}
return

CapsLock & o::
       if getkeystate("shift") = 0
               Send,{End}
       else
               Send,+{End}
return

;p the same as o because I keep hitting p instead of o
CapsLock & p::
       if getkeystate("shift") = 0
               Send,{End}
       else
               Send,+{End}
return

CapsLock & H::
       if getkeystate("shift") = 0
               Send,^{Left}
       else
               Send,+^{Left}
return

CapsLock & `;::
       if getkeystate("shift") = 0
               Send,^{Right}
       else
               Send,+^{Right}
return


;CapsLock & q::Send {BackSpace}
CapsLock & Space::Send,{Enter}
CapsLock & x::Send ^x
CapsLock & c::Send ^c
CapsLock & v::Send ^v
CapsLock & e::Send {esc}

CapsLock & q::
       if getkeystate("shift") = 0
               Send, {BackSpace} ;remove 1 character
       else
               Send,+{Del} ;delete whole line
return




;mouse movements simulation starts here
::CapsLock & e::MouseClick


CapsLock & w::
if GetKeyState("Alt", "p")
{
MoveAmount = 5
}
else
{
MoveAmount = 25
}
if GetKeyState("a", "p")
{
MouseMove -MoveAmount, -MoveAmount, 0, R;move up left
}
else if GetKeyState("d","p")
{
MouseMove MoveAmount, -MoveAmount, 0, R;move up right
}
else
{
MouseMove 0, -MoveAmount, 0, R;move up
}
return



CapsLock & s::
if GetKeyState("Alt", "p")
{
MoveAmount = 5
}
else
{
MoveAmount = 25
}
if GetKeyState("a","p")
{
	MouseMove -MoveAmount, MoveAmount, 0, R;move down left
}
if GetKeyState("d", "p")
{
	MouseMove MoveAmount, MoveAmount, 0, R;move down right
}
else
{
	MouseMove 0, MoveAmount, 0, R;move down
}
return


CapsLock & a::
if GetKeyState("Alt", "p")
{
MoveAmount = 5
}
else
{
MoveAmount = 25
}
if getKeyState("w", "p")
{
MouseMove -MoveAmount, -MoveAmount, 0, R;move up left
}
else if getKeyState("s", "p")
{
MouseMove -MoveAmount, MoveAmount, 0, R;move down left
}
else
{
MouseMove -MoveAmount, 0, 0, R;move left
}
return

CapsLock & d::
if GetKeyState("Alt", "p")
{
MoveAmount = 5
}
else
{
MoveAmount = 25
}
if getKeyState("w", "p") = 1
{
MouseMove MoveAmount, -MoveAmount, 0, R;move up right
}
else if getKeyState("s", "p") = 1
{
MouseMove MoveAmount, MoveAmount, 0, R;move down right
}
else
{
MouseMove MoveAmount, 0, 0, R;move right
}
return