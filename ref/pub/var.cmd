


:var
:: Description: sets the variable
:: class: command - parameter
:: Required parameters:
:: varname
:: value
:: Added handling so that a third param called echo will echo the variable back.
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set varname=%~1
set value=%~2
set %varname%=%value%
if "%~3" == "echo" echo %varname%=%value%
if "%~3" == "required" (
  if "%value%" == "" echo Missing %varname% parameter & set fatalerror=on
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


