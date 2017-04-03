@echo off
set type=%1
set depreciated=%2
if not defined type call :uifallback
set pubout=tests\pub-%type%%2.cmd
if exist "%pubout%" del "%pubout%"
if exist assemble\*.cmd del assemble\*.cmd 
if defined depreciated copy depreciated\*.cmd assemble\*.cmd
copy core\*.cmd assemble\*.cmd
copy /y %type%\*.cmd assemble\*.cmd
call :appendgroup assemble
goto :eof

:uifallback
rem make sure variables are set
if not defined site echo usage with parameters: make (classic or global or solo) &echo.
if not defined site echo You must specify a project name.&set /P type=Enter type to build: 
if not defined site set type=classic
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
FOR /F " delims=" %%s IN ('dir /b /a:-d /o:n %basedir%\*.cmd') DO call :%action% "%%s" %~2
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof

:appendfile
type %~2\%~1 >> %pubout%
echo     %~1 function
goto :eof

:appendgroup
rem call :separator %~1
echo added %~1 functions ==================
call :loopfiles appendfile %~1
goto :eof

:separator
set group=%~1
if %group%==classic (
  rem no output
) else if %group%==global (
  rem no output
) else if %group%==solo (
  rem no output
) else (
  echo. >>  %pubout%
  echo. >>  %pubout%
  echo rem ==================== %~1 functions =====================  >> %pubout%
  echo. >>  %pubout%
)
goto :eof
