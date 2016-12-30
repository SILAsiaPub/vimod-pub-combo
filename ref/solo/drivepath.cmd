

:drivepath
:: Description: returns the drive and path from a full drive:\path\filename
:: Class: command - parameter manipulation
:: Required parameters:
:: Group type: parameter manipulation
:: drive:\path\name.ext or path\name.ext
set drivepath=%~dp1
if defined echodrivepath echo %drivepath%goto :eof


