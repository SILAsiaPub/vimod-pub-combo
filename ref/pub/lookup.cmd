


:lookup
:: Description: Lookup a value in a file before the = and get value after the =
:: Required parameters:
:: findval
:: datafile
if defined masterdebug call :funcdebug %0
SET findval=%~1
set datafile=%~2
set lookupreturn=
FOR /F "tokens=1-2" %%i IN (%datafile%) DO IF "%%i" EQU "%findval%" SET lookupreturn=%%j
@echo lookup of %findval% returned: %lookupreturn%
if defined masterdebug call :funcdebug %0 end
goto :eof


