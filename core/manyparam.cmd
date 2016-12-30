:manyparam
:: Description: Allows spreading of long commands accross many line in a tasks file. Needed for wkhtmltopdf.
:: Class: command - exend
:: Required preset variables:
:: first - set for all after the first of manyparam
:: Optional preset variables:
:: first - Not required for first of a series
:: Required parameters:
:: newparam
if defined masterdebug call :funcdebug %0
set newparam=%~1
if not defined newparam echo Missing newparam parameter & goto :eof
set param=%param% %newparam%
if defined masterdebug call :funcdebug %0 end
goto :eof


