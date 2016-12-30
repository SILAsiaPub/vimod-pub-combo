:quoteinquote
:: Description: Resolves single quotes withing double quotes. Surrounding double quotes dissapea, singles be come doubles.
:: Class: command - internal - parameter manipulation
:: Required parameters:
:: varname
:: paramstring
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set varname=%~1
set paramstring=%~2
if defined paramstring set %varname%=%paramstring:'="%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


