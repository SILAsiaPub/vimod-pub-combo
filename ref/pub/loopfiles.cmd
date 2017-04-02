

:loopfiles
:: Description: Used to loop through a subset of files specified by the filespec from a single directory
:: Class:  command - loop
:: Required parameters:
:: action - can be any Vimod-Pub command like i.e. tasklist dothis.tasks
:: filespec
:: Optional parameters:
:: comment
:: Depends on:
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set action=%~1
set filespec=%~2
set comment=%~3
if not defined action echo Missing action parameter & goto :eof
if not defined filespec echo Missing filespec parameter & goto :eof
if defined comment echo %comment%
FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n %filespec%') DO call :%action% "%%s"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


