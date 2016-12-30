:menueval
:: Description: resolves the users entered letter and starts the appropriate function
:: run through the choices to find a match then calls the selected option
:: Required preset variable:
:: choice
:: Required parameters:
:: let
if defined masterdebug call :funcdebug %0
if defined varvalue goto :eof
set let=%~1
set option=option%let%
:: /I makes the IF comparison case-insensitive
IF /I '%Choice%'=='%let%' call :%%%option%%%
if defined masterdebug call :funcdebug %0 end
goto :eof


