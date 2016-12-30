

:loopdir
:: Description: Loops through all files in a directory
:: Class: command - loop
:: Required functions:
:: action - can be any Vimod-Pub command like i.e. tasklist dothis.tasks
:: extension
:: comment
set action=%~1
set basedir=%~2
echo %~3
FOR /F " delims=" %%s IN ('dir /b /a:d %basedir%') DO call :%action% "%%s"goto :eof


