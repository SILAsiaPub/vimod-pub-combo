

:menueval
:: Description: resolves the users entered letter and starts the appropriate function
:: run through the choices to find a match then calls the selected option
:: Required preset variable: 1
:: choice
:: Required parameters: 1
:: let
if defined masterdebug call :funcdebugstart menueval
if defined varvalue exit /b
set let=%~1
set option=option%let%
:: /I makes the IF comparison case-insensitive
IF /I '%Choice%'=='%let%' call :%%%option%%%
if defined masterdebug call :funcdebugendgoto :eof


