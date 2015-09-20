/**
 * @Author: Stuart Bannerman
 * @Date:   2015-08-17 10:05:03
 * @Last Modified by:   sbannerman
 * @Last Modified time: 2015-09-16 12:39:05
 * @Description: A bot written in AutoHotKey to run the reaction test at www.humanbenchmark.com
 */


; Standard keybinds
+^R::Reload      ; Reloads Script - Shift + Controls + R
+^P::Pause       ; Pauses  Script - Shift + Controls + P
Ins::Suspend     ; Suspend Script - Insert
Esc::ExitApp     ; Exit the Script - Escape

; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv
; Stop multiple bots from running
#SingleInstance force
; Recommended for new scripts due to its superior speed and reliability.
SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%
; Speed up script execution...hopefully: http://ahkscript.org/docs/commands/SetBatchLines.htm
SetBatchLines -1

; Ctrl + Right mouse button
^RButton::
    ; Get the pixel colour at the mouse position and saves it in the clipboard
    MouseGetPos Xpos, Ypos
    PixelGetColor Colour, %Xpos%, %Ypos%, RGB

    clipboard := Colour

    return

; Ctrl + Left mouse button
^LButton::

    Index := 0
    Max := 4
    ; Toggle the Running boolean so we can use the same short cut as an on/off switch
    Running := !Running
    ; Only get the mouse position when the run starts rather than ever loop to save on overhead
    MouseGetPos Xpos, Ypos
    ; Tell the user we have started
    TrayTip, Humanbenchmark Bot, Bot Running, 10
    while Running
    {
        ; Get the pixel colour at the mouse position (when the run was started)
        PixelGetColor Colour, %Xpos%, %Ypos%, RGB
        ; Check if the colour matches the green we are looking for
        if(Colour == "0x4BDB6A")
        {
            ; Green detected, click the mouse
            MouseClick, left
            ; Check if we have run all the tests we should have
            if(Index++ == Max)
            {
                break
            }
            ; Next test
            sleep 250
            MouseClick, left
        }
    }
    ; Finished the run
    TrayTip, Humanbenchmark Bot, Bot Stopped, 10
    ; Set Running to false ready for the next run
    Running := false
    return
