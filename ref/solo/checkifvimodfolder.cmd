

:checkifvimodfolder
:: Description: set the variable skipwriting so that the calling function does not write a menu line.
:: Used by: menu
:: Optional preset variables:
:: echomenuskipping
:: Required parameters:
:: project

set project=%~1
set skipwriting=

if "%project%" == "%projectsetupfolder%" (
    if defined echomenuskipping echo skipping dir: %project%
    set skipwriting=on
)
if "%project%" == "xml" (
    if defined echomenuskipping echo skipping dir: %project%
    set skipwriting=on
)
if "%project%" == "logs" (
    if defined echomenuskipping echo skipping dir: %project%
    set skipwriting=on
)goto :eof


