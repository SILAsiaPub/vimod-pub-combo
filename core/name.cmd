:name
:: Description: Gets the name of a file (no extension) from a full drive:\path\filename
:: Class: command - parameter manipulation
:: Required parameters:
:: drive:\path\name.ext or path\name.ext or name.ext
:: Created variable:
:: name
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set name=%~n1
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


