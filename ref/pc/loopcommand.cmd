

:loopcommand
:: Description: loops through a list created from a command like dir and passes that as a param to a tasklist.
:: Class: command - loop
:: Required parameters:
:: comment
:: list
:: action
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopcommand
if "%~1" neq "" set action=%~1
if "%~2" neq "" set list=%~2
if "%~3" neq "" set comment=%~3
echo "%comment%"
::echo on
FOR /F %%s IN ('%list%') DO call :%action% "%%s"
set action=
set list=
set comment=
if defined masterdebug call :funcdebugendgoto :eof


