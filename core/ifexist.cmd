:ifexist
:: Description: Tests if file exists and takes prescribed if it does
:: Class: command - condition
:: Required parameters: 2-3
:: testfile
:: action - xcopy, copy, move, rename, del, command, tasklist, func or fatal
:: Optional parameters:
:: param3 - a multi use param
:: param4 - a multi use param resolves internal single quotes to double quotes
:: Depends on:
:: funcdebug
:: nameext
:: command
:: tasklist
:: * - maybe any function
if defined masterdebug call :funcdebug %0
set testfile=%~1
set action=%~2
set param3=%~3
set param4=%~4
set param5=%~5
set param6=%~6
if not defined testfile echo missing testfile parameter & goto :eof
if not defined action echo missing action parameter & goto :eof
rem if defined param4 set param4=%param4:'="%
call :nameext "%~1"
if exist "%testfile%" (
  rem say what will happen
  if "%action%" == "xcopy" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "copy" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "move" echo %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "rename" echo %action% "%testfile%" "%param3%"
  if "%action%" == "del" echo %action% %param4% "%testfile%"
  if "%action%" == "func" echo call :%param3% "%param4%"
  if "%action%" == "command" echo call :command "%param3%" "%param4%"  "%param5%"
  if "%action%" == "command2file" echo call :command2file "%param3%" "%param4%" "%param5%" "%param6%"
  if "%action%" == "tasklist" echo call :tasklist "%param3%" "%param4%"
  if "%action%" == "append" echo copy "%param3%"+"%testfile%" "%param3%"
  if "%action%" == "appendtext" echo copy /A "%param3%"+"%testfile%" "%param3%"
  if "%action%" == "appendbin" echo copy /b "%param3%"+"%testfile%" "%param3%"
  if "%action%" == "addtext" echo  echo %param3% ^>^> "%param4%"
  if "%action%" == "type" echo type "%testfile%" ^>^> "%param3%"
  if "%action%" == "emptyfile" echo echo. ^> "%testfile%"
  rem now do what was said
  if "%action%" == "xcopy"  %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "copy" %action% %param4% "%testfile%" "%param3%" "%param5%"
  if "%action%" == "move" %action% %param4% "%testfile%" "%param3%"
  if "%action%" == "rename" %action% "%testfile%" "%param3%"
  if "%action%" == "del" %action% /Q "%testfile%"
  if "%action%" == "func" call :%param3% "%param4%"
  if "%action%" == "command" call :command "%param3%" "%param4%"  "%param5%"
  if "%action%" == "command2file" call :command2file "%param3%" "%param4%" "%param5%" "%param6%"
  if "%action%" == "tasklist" call :tasklist "%param3%" "%param4%"
  if "%action%" == "append" copy "%param3%"+"%testfile%" "%param3%"
  if "%action%" == "appendtext" copy /A "%param3%"+"%testfile%" /A "%param3%" /A
  if "%action%" == "append" copy /b "%param3%"+"%testfile%" /b "%param3%" /b
  if "%action%" == "addtext" echo %param3% >> "%param4%"
  if "%action%" == "type" type "%testfile%" >> "%param3%"
  if "%action%" == "emptyfile" echo.  > "%testfile%"
  if "%action%" == "fatal" (
    call :echolog "File not found! %message%"
    echo %message%
    echo The script will end.
    echo.
    pause
    goto :eof
  )
) else (
  echo %testfile% was not found to %action%
)
if defined masterdebug call :funcdebug %0 end
goto :eof


