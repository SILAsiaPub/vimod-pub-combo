




:manyparam
:: Description: Allows spreading of long commands accross many line in a tasks file. Needed for wkhtmltopdf.
:: Class: command - exend
:: Required preset variables: 1
:: first - set for all after the first of manyparam
:: Optional preset variables:
:: first - Not required for first of a series
:: Required parameters: 1
:: newparam
if defined masterdebug call :funcdebugstart manyparam
set newparam=%~1
set param=%param% %newparam%
if defined masterdebug call :funcdebugendgoto :eof


