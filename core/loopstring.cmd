:loopstring
:: Description: Loops through a list supplied in a string.
:: Class: command - loop
:: Required parameters:
:: action
:: string
:: comment
:: Note: 
:: Either preset or command parameters can be used
:: Depends on:
:: funcdebug
:: * - May be any function but a tasklist most likely
if defined masterdebug call :funcdebug %0
set action=%~1
set string=%~2
set comment=%~3
if not defined action echo Missing action parameter & goto :eof
if not defined string echo Missing string parameter & goto :eof
echo %comment%
::echo on
FOR /F "delims= " %%s IN ("%string%") DO call :%action% %%s& echo param %%s
rem clear variables
set action=
set string=
set comment=
if defined masterdebug call :funcdebug %0 end
goto:eof




