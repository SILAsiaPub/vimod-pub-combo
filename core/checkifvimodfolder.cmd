:checkifvimodfolder
:: Description: set the variable skipwriting so that the calling function does not write a menu line.
:: Used by: menu
:: Optional preset variables:
:: echomenuskipping
:: Required parameters:
:: project
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
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
)
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%
goto :eof


