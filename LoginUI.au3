#cs ----------------------------------------------------------------------------------
 Author:         	Se7enstars
 Youtube channel:	https://youtube.com/c/se7enstars | Please Subscribe to our channel
 AutoIt Version: 	3.3.14.5

 *** Used UDF GUICtrlOnHover ***
 Forum link...:      http://www.autoitscript.com/forum/index.php?s=&showtopic=55120
 Author.......:      G.Sandler a.k.a MrCreatoR (CreatoR's Lab, www.creator-lab.ucoz.ru, www.autoit-script.ru)
#ce ----------------------------------------------------------------------------------

#NoTrayIcon
#include <GUIConstants.au3>
#include <GUICtrlOnHover.au3>

Global $assets = @ScriptDir & "\Assets\"
Global $c_ui_background = 0xFFFFFF, $c_panelBottom = 0xDCDCDC, $c_txtWait = 0x5D5C61, $c_txt = 0x242227
Global $c_main = 0x3CA9E2, $c_mainHover = 0xF23C34

$ui_width = 320
$ui_height = 400

$ui = GUICreate("Login", $ui_width, $ui_height, Default, Default, $WS_POPUP, $WS_EX_CONTROLPARENT)
GUISetBkColor($c_ui_background, $ui)

$avatar = GUICtrlCreateIcon($assets & "user_0.ico", Default, $ui_width/2-48, 10, 96, 96)
GUICtrlSetCursor(-1, 0)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

$statusLbl = GUICtrlCreateLabel("Sign In", 0, 100, $ui_width, 40, $SS_CENTER + $SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, $c_txt)
GUICtrlSetFont(-1, 22, 700, Default, "Segoe UI", 5)

$loginInBorder = GUICtrlCreateLabel('', 48, 158, $ui_width-96, 26)
GUICtrlSetBkColor(-1, $c_main)
GUICtrlSetState(-1, $GUI_DISABLE)

$loginIn = GUICtrlCreateInput("Email", 52, 159, $ui_width-101, 24, $ES_AUTOHSCROLL+$ES_CENTER, $WS_EX_WINDOWEDGE)
GUICtrlSetFont(-1, 12, Default, Default, "Segoe UI", 5)
GUICtrlSetColor(-1, $c_txtWait)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

$passInBorder = GUICtrlCreateLabel('', 48, 200, $ui_width-96, 26)
GUICtrlSetBkColor(-1, $c_main)
GUICtrlSetState(-1, $GUI_DISABLE)

$passIn = GUICtrlCreateInput("Password", 52, 201, $ui_width-101, 24, $ES_AUTOHSCROLL+$ES_CENTER+$ES_PASSWORD, $WS_EX_WINDOWEDGE)
GUICtrlSetFont(-1, 12, Default, Default, "Segoe UI", 5)
GUICtrlSetColor(-1, $c_txtWait)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

$signBtn = GUICtrlCreateLabel('Sign In', 48, 244, $ui_width-96, 30, $SS_CENTER + $SS_CENTERIMAGE)
GUICtrlSetBkColor(-1, $c_main)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 12, Default, Default, "Segoe UI", 5)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

$remChck = GUICtrlCreateCheckbox("Remember Me", 48, 278, 105, 20)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 10, Default, Default, "Segoe UI", 5)

$forgetLbl = GUICtrlCreateLabel('Fogot Password?', 170, 278, 100, 20, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, $c_main)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 10, Default, Default, "Segoe UI", 5)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

$panelBottom = GUICtrlCreateLabel('', 0, $ui_height-50, $ui_width, 50)
GUICtrlSetBkColor(-1, $c_panelBottom)
GUICtrlSetState(-1, $GUI_DISABLE)

GUICtrlCreateLabel('Not a Member?', 60, ($ui_height-50)+15, 100, 20, $SS_CENTERIMAGE)
GUICtrlSetBkColor(-1, -2)
GUICtrlSetFont(-1, 10, Default, Default, "Segoe UI", 5)

$newAccLbl = GUICtrlCreateLabel('Create Account', 162, ($ui_height-50)+15, 100, 20, $SS_CENTERIMAGE)
GUICtrlSetBkColor(-1, -2)
GUICtrlSetColor(-1, $c_main)
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 10, Default, Default, "Segoe UI", 5)
_GUICtrl_OnHoverRegister(-1, "_SetHover", "_SetLeave")

_Animate()
GUISetState(@SW_SHOW, $ui)

While 1
	$msg = GUIGetMsg()
	Switch $msg
		Case $GUI_EVENT_CLOSE, $avatar
			_Animate(False)
			Exit
		Case $signBtn
			SoundPlay($assets & "click.wav")
	EndSwitch
WEnd

Func _SetHover($iCtrlID, $iParam)
	Switch $iCtrlID
		Case $avatar
			GUICtrlSetImage($iCtrlID, $assets & "user_1.ico")
			GUICtrlSetData($statusLbl, "Exit")
			_Signal()
		Case $loginIn
			GUICtrlSetBkColor($loginInBorder, $c_mainHover)
			If GUICtrlRead($loginIn) = "Email" Then
				GUICtrlSetData($loginIn, "")
				GUICtrlSetColor($loginIn, $c_txt)
			EndIf
			_Signal()
		Case $passIn
			GUICtrlSetBkColor($passInBorder, $c_mainHover)
			If GUICtrlRead($iCtrlID) = "Password" Then
				GUICtrlSetData($iCtrlID, "")
				GUICtrlSetColor($iCtrlID, $c_txt)
			EndIf
			_Signal()
		Case $signBtn
			GUICtrlSetColor($iCtrlID, $c_txt)
			GUICtrlSetBkColor($iCtrlID, $c_mainHover)
			_Signal()
		Case $forgetLbl
			GUICtrlSetFont($iCtrlID, 10, Default, 4, "Segoe UI", 5)
			_Signal()
			GUICtrlSetColor($iCtrlID, $c_mainHover)
		Case $newAccLbl
			GUICtrlSetFont($iCtrlID, 10, Default, 4, "Segoe UI", 5)
			GUICtrlSetColor($iCtrlID, $c_mainHover)
			_Signal()
	EndSwitch
EndFunc

Func _SetLeave($iCtrlID, $iParam)
	Switch $iCtrlID
		Case $avatar
			GUICtrlSetImage($iCtrlID, $assets & "user_0.ico")
			GUICtrlSetData($statusLbl, "Sign In")
		Case $loginIn
			GUICtrlSetBkColor($loginInBorder, $c_main)
			If GUICtrlRead($iCtrlID) = "" Then
				GUICtrlSetData($iCtrlID, "Email")
				GUICtrlSetColor($iCtrlID, $c_txtWait)
			EndIf
		Case $passIn
			GUICtrlSetBkColor($passInBorder, $c_main)
			If GUICtrlRead($iCtrlID) = "" Then
				GUICtrlSetData($iCtrlID, "Password")
				GUICtrlSetColor($iCtrlID, $c_txtWait)
			EndIf
		Case $signBtn
			GUICtrlSetColor($iCtrlID, 0xFFFFFF)
			GUICtrlSetBkColor($iCtrlID, $c_main)
		Case $forgetLbl
			GUICtrlSetFont($iCtrlID, 10, Default, Default, "Segoe UI", 5)
			GUICtrlSetColor($iCtrlID, $c_main)
		Case $newAccLbl
			GUICtrlSetFont($iCtrlID, 10, Default, Default, "Segoe UI", 5)
			GUICtrlSetColor($iCtrlID, $c_main)
	EndSwitch
EndFunc

Func _Signal()
	SoundPlay($assets & "hover.wav")
EndFunc

Func _Animate($fType = True)
	If $fType = True Then
		DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $ui, "int", 800, "long", 0x00080000) ;fade-in
	Else
		DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $ui, "int", 800, "long", 0x00090000) ;fade-out
	EndIf
EndFunc ;170 Lines total :)