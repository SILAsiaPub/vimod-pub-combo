:manyparamcmd
:: Description: places the command before all the serial parameters Needed for wkhtmltopdf.
:: Class: command - exend
:: Required preset variables:
:: param
:: Optional preset variables:
:: Required parameters:
:: command
if defined masterdebug call :funcdebug %0
set command=%~1
if not defined command echo Missing command parameter & goto :eof
rem this can't work here: call :quoteinquote param %param%
if defined param set param=%param:'="%
call :echolog "%command%" %param%
"%command%"  %param%
rem clear the first variable
set param=
if defined masterdebug call :funcdebug %0 end
goto :eof


