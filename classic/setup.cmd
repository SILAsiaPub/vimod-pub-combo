:setup
:: Description: sets variables for the batch file
:: Revised: 2016-05-04
:: Required prerequisite variables
:: projectpath
:: htmlpath
:: localvar
:: Func calls:
:: checkdir
set beginfuncstring=++ debugging is on ++++++++++++ starting func
set beginfuncstringtail=++++++++++++++
if exist setup-pub\functiondebug.settings if not defined skipsettings call :variableslist setup-pub\functiondebug.settings
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set basepath=%cd%
set projectbat="%projectpath%\logs\%curdate%-build.bat"
set endfuncstring=-------------------------------------- end func
rem check if logs directory exist and create if not there  DO NOT change to checkdir
if not exist "%cd%\logs" md "%cd%\logs"

rem Get the date format from the Registery: 0=US 1=AU 2=iso
set KEY_DATE="HKCU\Control Panel\International"
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v iDate`) DO set dateformat=%%A
rem get the date separator: / or -
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sDate`) DO set dateseparator=%%A
rem get the time separator: : or ?
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sTime`) DO set timeseparator=%%A
rem set project log file name by date
call :date
set projectlog=logs\%curdate%-build.log

rem set the predefined variables
call :variableslist setup-pub\vimod.variables

rem selfvalue is set so the list of path installed tools will become: set ccw32=ccw32. They are used this way so that if an absolute path is needed it can be set in user_installed.tools
rem the following line is removed as path tools moved back into user_installed.tools
rem set selfvalue=on

rem remove this for now
rem if exist setup-pub\user_path_installed.tools call :variableslist setup-pub\user_path_installed.tools

rem test if essentials exist
call :variableslist setup-pub\essential_installed.tools fatal
rem added to aid new users in setting up
if exist setup-pub\user_installed.tools call :variableslist setup-pub\user_installed.tools
if exist setup-pub\user_feedback.settings if not defined skipsettings call :variableslist setup-pub\user_feedback.settings
if exist setup-pub\functiondebug.settings if not defined skipsettings call :variableslist setup-pub\functiondebug.settings
if exist setup-pub\my.settings if not defined skipsettings call :variableslist setup-pub\my.settings
rem if not defined java call :testjava
set classpath=%classpath%;%extendclasspath%
call :checkdir %cd%\data\logs
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


