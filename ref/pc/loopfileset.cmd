

:loopfileset
:: Description: Loops through a list of files supplied by a file.
:: Class: command - loop
:: Required parameters:
:: action
:: fileset
:: comment
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopfileset
if "%~1" neq "" set action=%~1
if "%~2" neq "" set fileset=%~2
if "%~3" neq "" set comment=%~3
echo %comment%
::echo on
FOR /F %%s IN (%fileset%) DO call :%action% %%s
set action=
set fileset=
set comment=
if defined masterdebug call :funcdebugendgoto :eof


