:loopdir
:: Description: Loops through all files in a directory
:: Class: command - loop
:: Required parameters:
:: action - can be any Vimod-Pub command like i.e. tasklist dothis.tasks
:: extension
:: comment
:: Depends on:
:: * - May be any function but probably tasklist
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set action=%~1
set basedir=%~2
set comment=%~3
if not defined action echo Missing action parameter & goto :eof
if not defined basedir echo Missing basedir parameter & goto :eof
if defined comment echo %comment%
FOR /F " delims=" %%s IN ('dir /b /a:-d %basedir%') DO call :%action% "%%s"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof





