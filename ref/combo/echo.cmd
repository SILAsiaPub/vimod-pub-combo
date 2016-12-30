

:echo
if '%~1' == 'on' (
	echo on
) else if '%~1' == 'off' (
	echo off
) else if '%~1' == 'log' (
	call :echolog "%~2"
) else (
	echo %~1
)goto :eof


