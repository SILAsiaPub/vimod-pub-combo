

:tasklist
:: Discription: Processes a tasks file.
:: Required preset variables: 3
:: projectlog
:: setuppath
:: commontaskspath
:: Required parameters: 1
:: tasklistname
:: Func calls:
:: funcdebugstart
:: funcdebugend
:: nameext
:: * - tasks from tasks file
rem echo on
set tasklistname=%~1
set /A tasklistnumb=%tasklistnumb%+1
if "%tasklistnumb%" == "1" set errorsuspendprocessing=
if defined breaktasklist1 pause
call :checkdir "%projectpath%\xml"
call :checkdir "%projectpath%\logs"
set projectlog="%projectpath%\logs\%curdate%-build.log"
set projectbat="%projectpath%\logs\%curdate%-build.bat"
:: checks if the list is in the commontaskspath, setuppath (default), if not then tries what is there.
if exist "%setuppath%\%tasklistname%" (
    set tasklist=%setuppath%\%tasklistname%
    if defined echotasklist call :echolog "[---- tasklist%tasklistnumb% project %tasklistname% ---- %time% ---- "
    if defined echotasklist echo.
) else (
    if exist "%commontaskspath%\%tasklistname%" (
        set tasklist=%commontaskspath%\%tasklistname%
        if defined echotasklist call :echolog "[---- tasklist%tasklistnumb% common  %tasklistname% ---- %time% ----"
        if defined echotasklist echo.
    ) else (
        echo tasklist "%tasklistname%" not found
        pause
        exit /b
    )
)
if exist "%setuppath%\project.variables" (
      call :variableslist "%setuppath%\project.variables"
)
if defined breaktasklist2 pause
FOR /F "eol=# tokens=2 delims=;" %%i in (%tasklist%) do call :%%i  %errorsuspendprocessing%

if defined breaktasklist3 pause
if defined echotasklistend call :echolog "  -------------------  tasklist%tasklistnumb% ended.  %time%]"
rem echo off
set /A tasklistnumb=%tasklistnumb%-1goto :eof


