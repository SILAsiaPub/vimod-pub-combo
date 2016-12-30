

:ifnotexist
:: Description: If a file or folder do not exist, then performs an action.
:: Debugable: true
:: Required parameters: 3
:: testfile
:: action - xcopy, copy, del, call, command, tasklist, func or fatal
:: param3
:: Optional parameters:
:: param4
:: Usage copy: ;ifnotexist testfile copy infileif [switches]
:: Usage xcopy: ;ifnotexist testfile copy infileif [switches]
:: Usage del: ;ifnotexist testfile del infileif [switches]
:: Usage tasklist: ;ifnotexist testfile tasklist param3 param4
if defined masterdebug call :funcdebugstart ifnotexist
set testfile=%~1
set testfilename=%~nx1
set testpath=%~dp1
set action=%~2
set param3=%~3
set param4=%~4
set param4=%~5
if defined param4 set param4=%param4:'="%
if not exist  "%testfile%" (
  call :echolog "File not found! %testfilename%"
  call :echolog  "Not found in path: %testpath%"
  call :echolog "Doing: %action%"
  if "%action%" == "xcopy"  %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "copy"  %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "del"  %action% %param4% "%param3%"
  if "%action%" == "report" call :echolog "%param3%"
  if "%action%" == "recover" call :echolog "%param3%" 
  if "%action%" == "suspend"  set errorsuspendprocessing=on 
  if "%action%" == "command" call :command "%param3%" "%param4%" "%param5%"
  if "%action%" == "tasklist" call :tasklist "%tasklist%" "%param4%"
  if "%action%" == "func" call :%param3% "%param4%"
  if "%action%" == "fatal" (
    echo %param3%
    echo The script will end.
    echo.
    pause
    exit /b
  )
)
if defined masterdebug call :funcdebugendgoto :eof


