

:ifnotexist
:: Description: If a file or folder do not exist, then performs an action.
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
if defined echoifnotexist echo on
set testfile=%~1
set testfilename=%~nx1
set action=%~2
set param3=%~3
set param4=%~4
if defined param4 set param4=%param4:'="%
if not exist  "%testfile%" (
  if "%action%" == "xcopy" call :echolog "File not found! %testfile%"    & %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "copy" call :echolog "File not found! %testfile%"     & %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "del" call :echolog "File not found! %testfile%"      & %action% %param4% "%param3%"
  if "%action%" == "report" call :echolog "File not found! %testfile% - %param3%"
  if "%action%" == "recover" call :echolog "File not found! %testfile% - %param3%"  & goto :eof
  if "%action%" == "suspend" call :echolog "%param3% file not found! %testfilename%" & set errorsuspendprocessing=on  & goto :eof
  if "%action%" == "command" call :echolog "File not found! %testfile%"  & call :command "%param3%" "%param4%"
  if "%action%" == "tasklist" call :echolog "File not found! %testfile%" & call :tasklist "%tasklist%" "%param4%"
  if "%action%" == "func" call :echolog "File not found! %testfile%"     & call :%param3% "%param4%"
  if "%action%" == "fatal" (
    call :echolog "File not found! %message%"
    echo %message%
    echo The script will end.
    echo.
    pause
    exit /b
  )
)
if defined echoifnotexist echo offgoto :eof


