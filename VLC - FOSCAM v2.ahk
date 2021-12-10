#NoEnv
#SingleInstance, Force
SetTitleMatchMode, 2

; program: VLC medis player
; download: https://www.videolan.org/vlc/download-windows.html
; version: 3.0.16 Vetinari
; class: Qt5QWindowIcon

externalIP = ###.##.###.##
port = ###
username = PEN
Clipboard := "Pass%Word"

Run, "C:\Program Files\VideoLAN\VLC\vlc.exe" rtsp://%externalIP%:%port%/videoMain,,, vlcPID
Sleep, 2000

ControlSend,, %username%{TAB}, RTSP authentication	; sends just fine even if "authentication" window does not have focus
Sleep, 1000
ControlSend,, ^v, RTSP authentication				; on its own line because experiencing trouble with this part...
Sleep, 1000											; also, if this "authentication" window does not have focus,
ControlSend,, {ENTER}, RTSP authentication			; '^v' does not send anything to it at all!!
Sleep, 1000
Clipboard := ""
WinMinimize, VLC media player

ExitApp												; for testing purposes only.

; ------------------------------------------------ 	; the following does not perform as desired
WinGetClass, vlcCLASS, VLC media player				; nothing, PID, CLASS, TITLE, works properly with the video stream window
WinMove, ahk_class %vlcCLASS%,, 1376, 23 , 528, 406	; move and resize the video stream window
Sleep, 1000
ControlSend,, ^h, ahk_class %vlcCLASS%				; hide some UI stuff

ExitApp
