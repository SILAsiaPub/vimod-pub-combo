

:ifexist
:: Description: Tests if file exists and takes prescribed if it does
:: Class: command - condition
:: Required parameters: 2-3
:: testfile
:: action - xcopy, copy, move, rename, del, command, tasklist, func or fatal
:: Optional parameters:
:: param3 - a multi use param
:: param4 - a multi use param resolves internal single quotes to double quotes
if defined masterdebug call :funcdebugstart ifexist
set testfile=%~1
set action=%~2
set param3=%~3
set param4=%~4
if defined param4 set param4=%param4:'="%

if exist "%testfile%" (
  rem say what will happen
  if "%action%" == "xcopy" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "copy" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "move" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "rename" echo %action% "%testfile%" "%param3%"
  if "%action%" == "del" echo %action% %param4% "%testfile%"
  if "%action%" == "func" echo call :%param3% "%param4%"
  if "%action%" == "command" echo call :command "%param3%" "%param4%"
  if "%action%" == "tasklist" echo call :tasklist "%param3%" "%param4%"
  rem now do what was said
  if "%action%" == "xcopy"  %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "copy" %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "move" if defined param3 %action% %param4% "%testfile%" "%param3%"
  rem added if exist to prevent exit from bat if param3 is empty
  if "%action%" == "rename" %action% "%testfile%" "%param3%"
  if "%action%" == "del" %action% /Q "%testfile%"
  if "%action%" == "func" call :%param3% "%param4%"
  if "%action%" == "command" call :command "%param3%" "%param4%"
  if "%action%" == "tasklist" call :tasklist "%param3%" "%param4%"
  if "%action%" == "fatal" (
    call :echolog "File not found! %message%"
    echo %message%
    echo The script will end.
    echo.
    pause
    exit /b
  )
) else (
  echo %testfile% not found to %action%
)
if defined masterdebug call :funcdebugendgoto :eof


