:lookup
:: Description: Lookup a value in a file before the = and get value after the =
:: Required parameters:
:: findval
:: datafile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
SET findval=%~1
set datafile=%~2
set lookupreturn=
FOR /F "tokens=1,2 delims==" %%i IN (%datafile%) DO IF %%i EQU %findval% SET lookupreturn=%%j
@echo lookup of %findval% returned: %lookupreturn%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


