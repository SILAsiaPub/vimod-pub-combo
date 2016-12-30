

:var
:: Description: sets the variable
:: class: command - parameter
:: Required parameters: 2
:: varname
:: value
:: Added handling so that a third param called echo will echo the variable back.
set varname=%~1
set value=%~2
set %varname%=%value%
if "%~3" == "echo" echo %varname%=%value%
if "%~3" == "required" (
  if "%value%" == "" echo Missing %varname% parameter & set fatalerror=on
)goto :eof


