#RequireAdmin
#include <WinAPI.au3>
#include <Color.au3>
Func GetColor($GetTitle, $X, $Y, $color, $Return = 0, $Pattern = 1, $shade = 5)
	Local $handle
	Local $hDC
	Local $iColor
	Local $sColor
	Local $RGB, $RGB1 ;เก็บค่าสี RGB แยย Array
	Local $R1, $G1, $B1, $R2, $G2, $B2 ;เก็ยค่าสีแบบ DEC RGB
	If $Return > 2 Or $Return < 0 Then
		Return "Return False"
	EndIf
	For $XX = $X - $Pattern To $X + $Pattern
		For $YY = $Y - $Pattern To $Y + $Pattern
			$handle = WinGetHandle($GetTitle)
			$hDC = _WinAPI_GetWindowDC($handle)
			$iColor = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $XX, "int", $YY)
			$iColor1 = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $X, "int", $Y)
			$sColor = Hex($iColor[0], 6)
			$sColor1 = Hex($iColor1[0], 6)
			$rsColor = Hex("0x" & StringRight($sColor, 2) & StringMid($sColor, 3, 2) & StringLeft($sColor, 2), 6)
			$rsColor1 = Hex("0x" & StringRight($sColor1, 2) & StringMid($sColor1, 3, 2) & StringLeft($sColor1, 2), 6)
			$RGB = _ColorGetRGB("0x" & $rsColor)
			$RGB1 = _ColorGetRGB("0x" & $rsColor)
			If $color = 0 Then Return "0x" & $rsColor

			If $color = "0x" & $rsColor1 Then
				If $Return = 0 Then Return True
				If $Return = 1 Then Return "0x" & $rsColor1
				If $Return = 2 Then Return StringSplit($X & "/" & $Y, "/", 6)
			ElseIf $shade > 0 Then ;หาแบบค่าShade+-
				For $R = 0 To $shade
					$Endfor = 0
					$R1 = $RGB[0] + $R
					$R2 = $RGB1[0] - $R
					For $G = 0 To $shade
						$G1 = $RGB[1] + $G
						$G2 = $RGB1[1] - $G
						For $B = 0 To $shade
							$B1 = $RGB[2] + $B
							$B2 = $RGB1[2] - $B
							$RGB2 = "0x" & Hex($R1, 2) & Hex($G1, 2) & Hex($B1, 2)
							$RGB3 = "0x" & Hex($R2, 2) & Hex($G2, 2) & Hex($B2, 2)
							If $color = $RGB2 Then
								If $Return = 0 Then Return True
								If $Return = 1 Then Return $RGB2
								If $Return = 2 Then Return StringSplit($XX & "/" & $YY, "/", 6)
							ElseIf $color = $RGB3 Then
								If $Return = 0 Then Return True
								If $Return = 1 Then Return $RGB3
								If $Return = 2 Then Return StringSplit($XX & "/" & $YY, "/", 6)
							EndIf
						Next
					Next
				Next
			EndIf
			_WinAPI_ReleaseDC($handle, $hDC)
		Next
	Next
	If $Return = 2 Then Return StringSplit(0 & "/" & 0, "/", 6)
	If $Return = 0 Or 1 Then Return False
EndFunc   ;==>GetColor

Func Searchcolor($GetTitle, $X, $Y, $X3, $Y3, $color, $Return = 0, $shade = 5)
	Local $handle
	Local $hDC
	Local $iColor
	Local $sColor
	Local $X1 = $X
	Local $Y1 = $Y
	Local $X2 = $X3
	Local $Y2 = $Y3
	Local $Return1 = $Return
	Local $shade1 = $shade
	Local $Wingettitle = $GetTitle
	Local $RGB, $RGB1
	Local $R1, $G1, $B1, $R2, $G2, $B2
	If $Return > 2 Or $Return < 0 Then
		Return "Return False"
	EndIf
	For $XX = $X1 To $X2
		For $YY = $Y1 To $Y2
			$handle = WinGetHandle($Wingettitle)
			$hDC = _WinAPI_GetWindowDC($handle)
			$iColor = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $XX, "int", $YY)
			$sColor = Hex($iColor[0], 6)
			$rsColor = Hex("0x" & StringRight($sColor, 2) & StringMid($sColor, 3, 2) & StringLeft($sColor, 2), 6)
			$RGB = _ColorGetRGB("0x" & $rsColor)
			$RGB1 = _ColorGetRGB("0x" & $rsColor)
			If $color = 0 Then Return "0x" & $rsColor

			If $color = "0x" & $rsColor Then
				If $Return1 = 0 Then Return True
				If $Return1 = 1 Then Return "0x" & $rsColor
				If $Return1 = 2 Then Return "ค่าปกติ"
				If $Return1 = 3 Then Return StringSplit($XX & "/" & $YY, "/", 6)
			ElseIf $shade > 0 Then
				For $R = 0 To $shade1
					$Endfor = 0
					$R1 = $RGB[0] + $R
					$R2 = $RGB1[0] - $R
					For $G = 0 To $shade1
						$G1 = $RGB[1] + $G
						$G2 = $RGB1[1] - $G
						For $B = 0 To $shade1
							$B1 = $RGB[2] + $B
							$B2 = $RGB1[2] - $B
							$RGB2 = "0x" & Hex($R1, 2) & Hex($G1, 2) & Hex($B1, 2)
							$RGB3 = "0x" & Hex($R2, 2) & Hex($G2, 2) & Hex($B2, 2)
;~ 								Addmsg($RGB2)
							If $color = $RGB2 Then
								If $Return1 = 0 Then Return True
								If $Return1 = 1 Then Return $RGB2
								If $Return1 = 2 Then Return StringSplit($XX & "/" & $YY, "/", 6)
							ElseIf $color = $RGB3 Then
								If $Return1 = 0 Then Return True
								If $Return1 = 1 Then Return $RGB3
								If $Return1 = 2 Then Return StringSplit($XX & "/" & $YY, "/", 6)
							EndIf
						Next
					Next
				Next
			EndIf
			_WinAPI_ReleaseDC($handle, $hDC)
		Next
	Next
	If $Return1 = 2 Then Return StringSplit(0 & "/" & 0, "/", 6)
	If $Return1 = 0 Or 1 Then Return False
EndFunc   ;==>Searchcolor
