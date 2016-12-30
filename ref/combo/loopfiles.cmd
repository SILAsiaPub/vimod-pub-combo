

:loopfiles
:: Description: Used to loop through a subset of files specified by the filespec from a single directory
:: Class:  command - loop
:: Required functions:
:: action - can be any Vimod-Pub command like i.e. tasklist dothis.tasks
:: filespec
:: Optional parameters:
:: comment
set action=%~1
set filespec=%~2
if "%~3" neq "" echo %~3
FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n %filespec%') DO call :%action% "%%s"goto :eof


