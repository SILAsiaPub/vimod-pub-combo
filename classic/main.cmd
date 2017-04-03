:main                              
:: Description: Starting point of pub.cmd, test commandline options if present
:: Class: command - internal - startup
:: Optional parameters:
:: projectpath or debugfunc - project path must contain a sub folder setup containing a project.menu or dubugfunc must be "debug"
:: functiontodebug
:: * - more debug parameters
:: Depends on:
:: setup
:: tasklist
:: menu
:: * - In debug mode can call any function
rem set the codepage to unicode to handle special characters in parameters
set debugstack=00
if "%PUBLIC%" == "C:\Users\Public" (
      rem if "%PUBLIC%" == "C:\Users\Public" above is to prevent the following command running on Windows XP
      if not defined skipsettings chcp 65001
      )
echo.
if not defined skipsettings echo                        Vimod-Pub
if not defined skipsettings echo     Various inputs multiple outputs digital publishing
if not defined skipsettings echo       https://github.com/silasiapub/vimod-pub
echo    ----------------------------------------------------
if defined echofromstart echo on
set overridetype=%1
set projectpath=%2
set functiontodebug=%2
set inputtasklist=%3
set params=%3 %4 %5 %6 %7 %8 %9
if defined projectpath set drive=%~d2
if not defined projectpath set drive=c:
if "%overridetype%" == "tasklist" (
  rem when this is moved in with the other parameters, there are some errors.
  rem @echo on
  set count=0
  if defined projectpath %drive%
  cd %~p0 
  call :setup
  set setuppath=%projectpath%\setup
  call :tasklist %inputtasklist%
  echo Finished running %inputtasklist%
  exit /b 0
)
call :setup
if not defined overridetype (
  rem default option with base menu
  call :menu data\%projectsetupfolder%\project.menu "Choose Group?"
) else ( 
if "%overridetype%" == "debug" (
    @echo debugging %functiontodebug%
    call :%functiontodebug% %params%
  ) else if "%overridetype%" == "menu" (
    rem this option when a valid menu is chosen
    if exist "%projectpath%\%projectsetupfolder%\project.menu" (
      call :menu "%projectpath%\%projectsetupfolder%\project.menu" "Choose project action?"
    )
  ) else (
    @echo Unknown parameter override word: %overridetype%
    @echo Valid override words: tasklist, menu, debug
    @echo Usage: pub tasklist pathtotasklist/tasklistname.tasks 
    @echo Usage: pub menu pathtomenu/project.menu
    @echo Usage: pub debug funcname [parameters]
  )
) 
goto :eof


