

rem Loops ======================================================================

:serialtasks
:looptasks
:: Description: loop through tasks acording to %list%
:: Class: command
:: Required parameters: 1
:: tasklistfile
:: list
:: comment
if defined masterdebug call :funcdebugstart looptasks
set tasklistfile=%~1
set list=%~2
set comment=%~3
echo "%comment%"
FOR /F %%s IN (%list%) DO call :tasklist "%tasklistfile%" %%s
set list=
set comment=
echo =====^> end looptasks
if defined masterdebug call :funcdebugend
goto:eof

:loop
:: Description: a general loop, review parametes before using, other dedcated loops may be easier to use.
:: Calss: command - loop
:: Required preset variables:
:: looptype - Can be any of these: string, listinfile or command
:: comment
:: string or file or command
:: function
:: Optional preset variables:
:: foroptions - eg "eol=; tokens=2,3* delims=, slip=10"
:: Required functions:
:: tasklist
if defined masterdebug call :funcdebugstart loop
if defined echoloopcomment echo "%comment%"
if "%looptype%" == "" echo looptype not defined, skipping this task& exit /b
rem the command type may be used to process files from a command like: dir /b *.txt
if "%looptype%" == "command" set command=%command:'="%
if "%looptype%" == "command" (
      FOR /F %%s IN ('%command%') DO call :%function% "%%s"
)
rem the listinfile type may be used to process the lines of a file.
if "%looptype%" == "listinfilespaced" (
      FOR /F "%foroptions%" %%s IN (%file%) DO call :%function% "%%s" %%t %%u
)
rem the listinfile type may be used to process the lines of a file.
if "%looptype%" == "listinfile" (
      FOR /F "eol=# delims=" %%s IN (%file%) DO call :%function% "%%s"
)
rem the string type is used to process a space sepparated string.
if "%looptype%" == "string" (
      FOR /F "%foroptions%" %%s IN (%string%) DO call :%function% "%%s"
)
rem clear function and tasklist variables in case of later use.
set function=
set tasks=
if defined masterdebug call :funcdebugend
goto:eof

:loopcommand
:: Description: loops through a list created from a command like dir and passes that as a param to a tasklist.
:: Class: command - loop
:: Required parameters:
:: comment
:: list
:: action
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopcommand
if "%~1" neq "" set action=%~1
if "%~2" neq "" set list=%~2
if "%~3" neq "" set comment=%~3
echo "%comment%"
::echo on
FOR /F %%s IN ('%list%') DO call :%action% "%%s"
set action=
set list=
set comment=
if defined masterdebug call :funcdebugend
goto:eof

:loopfileset
:: Description: Loops through a list of files supplied by a file.
:: Class: command - loop
:: Required parameters:
:: action
:: fileset
:: comment
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopfileset
if "%~1" neq "" set action=%~1
if "%~2" neq "" set fileset=%~2
if "%~3" neq "" set comment=%~3
echo %comment%
::echo on
FOR /F %%s IN (%fileset%) DO call :%action% %%s
set action=
set fileset=
set comment=
if defined masterdebug call :funcdebugend
goto:eof

:loopstring
:: Description: Loops through a list supplied in a string.
:: Class: command - loop
:: Required parameters:
:: comment
:: string
:: action
:: Parameter note: Either preset or command parameters can be used
if defined masterdebug call :funcdebugstart loopstring
if "%~1" neq "" set action=%~1
if "%~2" neq "" set string=%~2
if "%~3" neq "" set comment=%~3
echo %comment%
::echo on
FOR %%s IN (%string%) DO call :%action% %%s
rem clear variables
set action=
set string=
set comment=
if defined masterdebug call :funcdebugend
goto:eof

:runloop
:: Description: run loop with parameters
:: Class: command - loop - depreciated
set looptype=%~1
set action=%~2
set string=%~3
set fileset=%~3
set list=%~3
set comment=%~4
set string=%string:'="%
call :%looptype%goto :eof


