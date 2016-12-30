:ext
:: Description: returns file extension from a full drive:\path\filename
:: Class: command - parameter manipulation
:: Required parameters:
:: drive:\path\name.ext or path\name.ext or name.ext
:: created variable:
:: nameext
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set ext=%~x1
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


