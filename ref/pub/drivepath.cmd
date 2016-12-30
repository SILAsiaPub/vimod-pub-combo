

:drivepath
:: Description: returns the drive and path from a full drive:\path\filename
:: Class: command - parameter manipulation
:: Required parameters:
:: Group type: parameter manipulation
:: drive:\path\name.ext or path\name.ext
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set drivepath=%~dp1
if defined echodrivepath echo %drivepath%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


