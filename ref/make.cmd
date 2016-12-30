@echo off
set type=%1
if not defined type echo You must specify classic, global or solo as the first parameter. & goto :eof
set pubout=pub-%type%.cmd
set depreciated=%2
if exist "%pubout%" del "%pubout%"
call :appendgroup %type%
if defined depreciated call :appendgroup depreciated
goto :eof

:loopfiles
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
FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n %basedir%') DO call :%action% "%%s" %~2
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof

:appendfile
type %~2\%~1 >> %pubout%
echo     %~1 function
goto :eof

:appendgroup
call :separator %~1
echo added %~1 functions ==================
call :loopfiles appendfile %~1
goto :eof

:separator
set group=%~1
if %group%==classic (
  rem no output
) else if %group%==global (
  rem no output
) else if %group%==pub (
  rem no output
) else if %group%==pc (
  rem no output
) else if %group%==solo (
  rem no output
) else (
  echo. >>  %pubout%
  echo. >>  %pubout%
  echo rem ==================== %~1 functions =====================  >> %pubout%
  echo. >>  %pubout%
)