

:loopstring
:: Description: Loops through a list supplied in a string.
:: Class: command - loop
:: Required parameters:
:: comment
:: string
:: action
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopstring
if "%~1" neq "" set action=%~1
if "%~2" neq "" set string=%~2
if "%~3" neq "" set comment=%~3
echo %comment%
::echo on
FOR %%s IN (%string%) DO call :%action% %%s
rem clear variables
set action=
set string=
set comment=
if defined masterdebug call :funcdebugendgoto :eof


