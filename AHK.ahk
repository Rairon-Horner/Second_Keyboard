#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
#SingleInstance force
#MaxHotkeysPerInterval 2000
#WinActivateForce
DetectHiddenWindows, On


getSpotifyHwnd(){
	WinGet, spotifyHwnd, ID, ahk_exe spotify.exe
	spotifyHwnd:=DllCall("GetWindow", "uint", spotifyHwnd,"uint",2)
	spotifyHwnd:=DllCall("GetWindow", "uint", spotifyHwnd, "uint",2)
	Return spotifyHwnd
}

spotifyKey(key){
	spotifyHwnd:=getSpotifyHwnd()
	ControlFocus,Chrome_RenderWidgetHostHWND1,ahk_id%spotifyHwnd%
	ControlSend, ,%key%,ahk_id%spotifyHwnd%
	Return
}


; REQUIRE SECOND KEYBOARD!----------------------------------------------
~F24::
	FileRead, key, C:\Users\rairo\Desktop\second_keyboard\key.txt
	;tippy(key)


	; DAVINCI HOTKEYS---------------------------------------------------
	IfWinActive, ahk_exe Resolve.exe
	{
		; New Node
		if(key = "n"){
			Send, !s
		}
		
		else if(key = "Escape"){
			Send, ^z
		}
		
		else if (key = "f"){
			Send, p
		}
		
		else if (key = "e"){
			Send, +d
		}
		
		; Hide all windows
		else if(key = "space"){
			Send, {Space}
		}
		
		; Navbar
		else if(key = "1"){
			Send, #1
		}
		
		else if(key = "2"){
			Send, #2
		}
		
		else if(key = "3"){
			Send, #3
		}
		
		else if(key = "4"){
			Send, #4
		}
		
		else if(key = "5"){
			Send, #5
		}
		
		else if(key = "6"){
			Send, #6
		}
		
		else if(key = "7"){
			Send, #7
		}
		
		else if(key = "8"){
			Send, #8
		}
		
		Return
	}
	; ------------------------------------------------------------------
	else
	; ANOTHER HOTKEYS---------------------------------------------------
	{	
		; Volume up
		If(key = "up"){
			SoundSet,+5
		}
		; Volume down
		else if(key = "down"){
			SoundSet,-5
		}
		
		; Spotify next song
		else if(key = "right"){
			spotifyKey("^{Right}")
		}
		; Spotify prev. song
		else if(key = "left"){
			spotifyKey("^{Left}")
		}
		
		; Navbar
		else if(key = "1"){
			Send, #1
		}
		
		else if(key = "2"){
			Send, #2
		}
		
		else if(key = "3"){
			Send, #3
		}
		
		else if(key = "4"){
			Send, #4
		}
		
		else if(key = "5"){
			Send, #5
		}
		
		else if(key = "6"){
			Send, #6
		}
		
		else if(key = "7"){
			Send, #7
		}
		
		else if(key = "8"){
			Send, #8
		}
		
		; Hide all windows
		else if(key = "space"){
			Send, #d
		}
		
		; Clipboard 1
		else if(key = "z"){
			Send, ^c
			Sleep, 100
			Clipboard_1 := Clipboard
		}
		
		else if(key = "a"){
			Send, %Clipboard_1%
		}
		
		; Clipboard 2
		else if(key = "x"){
			Send, ^c
			Sleep, 100
			Clipboard_2 := Clipboard
		}
		
		else if(key = "s"){
			Send, %Clipboard_2%
		}
		
		
		
		Return
	}
	; ------------------------------------------------------------------



Tippy(tipsHere, wait:=333)
{
ToolTip, %tipsHere% TP,,,8
SetTimer, noTip, %wait%
}
noTip:
	ToolTip,,,,8
return