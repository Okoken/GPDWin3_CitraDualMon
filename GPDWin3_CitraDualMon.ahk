#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Joy5::
    JoyZ := GetKeyState("JoyZ")
    if GetKeyState("Joy5") and GetKeyState("Joy9") and GetKeyState("Joy10") and JoyZ > 75
    {
        ; 1. Start sizer
        Process, Exist , sizer.exe
        if ErrorLevel = 0
            Run %A_ScriptDir%\sizer\sizer.exe

        ; 2. Enable Virtual Monitor
        Run %ComSpec% /c devcon enable root\iddsampledriver
        Sleep 2000

        ; 3. Update VNC Server target monitor and start VNC server
        Run %ComSpec% /c python %A_ScriptDir%\SetVncSecMonitor.py
        Run %ComSpec% /c net start vncserver

        ; 4. Backup qt-config and update Layout, run Citra
        SetWorkingDir C:\Users\%A_UserName%\AppData\Roaming\Citra\config
        FileCopy, qt-config.ini, qt-config.ini.bak, true

        IniDelete, qt-config.ini, Layout, swap_screen\default
        IniDelete, qt-config.ini, Layout, upright_screen\default
        IniDelete, qt-config.ini, Layout, custom_layout\default
        IniDelete, qt-config.ini, Layout, custom_top_left\default
        IniDelete, qt-config.ini, Layout, custom_top_top\default
        IniDelete, qt-config.ini, Layout, custom_top_right\default
        IniDelete, qt-config.ini, Layout, custom_top_bottom\default
        IniDelete, qt-config.ini, Layout, custom_bottom_left\default
        IniDelete, qt-config.ini, Layout, custom_bottom_top\default
        IniDelete, qt-config.ini, Layout, custom_bottom_right\default
        IniDelete, qt-config.ini, Layout, custom_bottom_bottom\default
        IniDelete, qt-config.ini, UI, singleWindowMode\default

        IniWrite, false, qt-config.ini, Layout, swap_screen
        IniWrite, false, qt-config.ini, Layout, upright_screen
        IniWrite, true, qt-config.ini, Layout, custom_layout
        IniWrite, 40, qt-config.ini, Layout, custom_top_left
        IniWrite, 0, qt-config.ini, Layout, custom_top_top
        IniWrite, 1240, qt-config.ini, Layout, custom_top_right
        IniWrite, 720, qt-config.ini, Layout, custom_top_bottom
        IniWrite, 1280, qt-config.ini, Layout, custom_bottom_left
        IniWrite, 0, qt-config.ini, Layout, custom_bottom_top
        IniWrite, 2080, qt-config.ini, Layout, custom_bottom_right
        IniWrite, 600, qt-config.ini, Layout, custom_bottom_bottom
        IniWrite, false, qt-config.ini, UI, singleWindowMode

        Run C:\Users\%A_UserName%\AppData\Local\Citra\canary-mingw\citra-qt.exe

        ; 5. Set UI
        SetUI()
    }
    return

Joy6::
    JoyZ := GetKeyState("JoyZ")
    if GetKeyState("Joy6") and GetKeyState("Joy9") and GetKeyState("Joy10") and JoyZ < 25
    {
        ; 1. Show taskbar
        HideShowTaskbar(false)

        ; 2. Kill Citra
        Process, Close, citra-qt.exe

        ; 3. Roll back Citra config
        SetWorkingDir C:\Users\%A_UserName%\AppData\Roaming\Citra\config
        if FileExist("qt-config.ini.bak")
        FileCopy, qt-config.ini.bak, qt-config.ini, true   
        
        ; 4. Stop VNC server
        Run %ComSpec% /c net stop vncserver

        ; 5. Disable Virtual Monitor
        Run %ComSpec% /c devcon disable root\iddsampledriver

        ; 6. Kill sizer
        Process, Close, sizer.exe
    }
    return

!e:: ; For debug
    ; Set UI
    SetUI()
    return

!r:: ; For debug
    ; Reset UI
    ResetUI()
    return

; Set UI
SetUI() {
    ; Hide taskbar
    HideShowTaskbar(true)

    ; Expand Citra game window and hide border
    Loop
    {	
        UniqueID := WinExist("Citra Canary | HEAD-")
        Sleep, 2000
        if UniqueID
        {
            WinActivate, ahk_id %UniqueID%
            break
        }
    }
    HideWindowBorder(WinExist("A"))
    Send ^+!#c ; Shortcut of sizer setting 'GPDWin3_CitraDualMon'
}

; Reset UI
ResetUI() {
    ; Show taskbar
    HideShowTaskbar(false)

    ; Show Citra game window border
    Loop
    {	
        UniqueID := WinExist("Citra Canary | HEAD-")
        Sleep, 2000
        if UniqueID
        {
            WinActivate, ahk_id %UniqueID%
            break
        }
    }
    ShowWindowBorder(WinExist("A"))
}

/*  Extracted from hidebar-nightlight-wintop.ahk
 *  orazdow
 *  https://gist.github.com/orazdow/8479a5af2a4649edf106471916c127d5
 */
HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}

/*  Modified from YABT+ - Yet Another Borderless-Window Toggle
 *  by Barrow (March 30, 2012)
 *  rewritten by kon (May 16, 2014)
 *  http://www.autohotkey.com/board/topic/78903-yabt-yet-another-borderless-window-toggle/page-2#entry650488
 *  updated by Hastarin (Dec 5, 2014)
 *  updated by WAZAAAAA (Sep 27, 2016)
 *  tested with AutoHotkey v1.1.24.01
 */

HideWindowBorder(Window:="") {
	WinSet, Style, -0xC00000, % "ahk_id " Window    ; Remove borders
	WinSet, Style, -0x40000, % "ahk_id " Window    ; Including the resize border
	WinSet, ExStyle, -0x00000200, % "ahk_id " Window ;Also WS_EX_CLIENTEDGE
}

ShowWindowBorder(Window:="") {
	WinSet, Style, +0x40000, % "ahk_id " Window    		; Reapply borders
	WinSet, Style, +0xC00000, % "ahk_id " Window
	WinSet, ExStyle, +0x00000200, % "ahk_id " Window ;Also WS_EX_CLIENTEDGE
}