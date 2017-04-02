

:command2var
:: Description: creates a variable from the command line
:: Class: command - loop
:: Required parameters:
:: varname
:: command
:: comment
:: Depends on:
:: funcdebug
:: * - Maybe any function but most likely a tasklist
:: Note: Either preset or command parameters can be used
if defined masterdebug call :funcdebug %0
set commandline=%~1
set varname=%~2
set invalid=%~3
if not defined varname echo missing varname parameter & goto :eof
if not defined commandline echo missing list parameter & goto :eof
if defined comment echo %comment%
FOR /F %%s IN ('%commandline%') DO set %varname%=%%s
set varname=
set commandline=
set comment=
if "%varname%" == "%invalid%" echo invalid & set skip=on
if defined masterdebug call :funcdebug %0 endgoto :eof


