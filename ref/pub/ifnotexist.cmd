

:ifnotexist
:: Description: If a file or folder do not exist, then performs an action.
:: Required parameters:
:: testfile
:: action - xcopy, copy, del, call, command, tasklist, func or fatal
:: param3
:: Optional parameters:
:: param4
:: Depends on:
:: funcdebug
:: echolog
:: command
:: tasklist
:: * - Any function
:: Usage 
:: ;ifnotexist testfile copy infileif [switches]
:: ;ifnotexist testfile xcopy infileif [switches]
:: ;ifnotexist testfile del infileif [switches]
:: ;ifnotexist testfile tasklist param3 param4
if defined masterdebug call :funcdebug %0
set testfile=%~1
set action=%~2
set param3=%~3
set param4=%~4
set param5=%~5
if not defined testfile echo missing testfile parameter & goto :eof
if not defined action echo missing action parameter & goto :eof
if defined param4 set param4=%param4:'="%
if not exist  "%testfile%" (
  if "%action%" == "xcopy" call :echolog "File not found! %testfile%"    & %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "copy" call :echolog "File not found! %testfile%"     & %action% %param4% "%param3%" "%testfile%"
  if "%action%" == "resources" call :echolog "File not found! %testfile%"     & xcopy /e/y "resources\%param3%" "%param4%"
  if "%action%" == "del" call :echolog "File not found! %testfile%"      & %action% %param4% "%param3%"
  if "%action%" == "report" call :echolog "File not found! %testfile% - %param3%"
  if "%action%" == "recover" call :echolog "File not found! %testfile% - %param3%"  & goto :eof
  if "%action%" == "command" call :echolog "File not found! %testfile%"  & call :command "%param3%" "%param4%"
  if "%action%" == "tasklist" call :echolog "File not found! %testfile%" & call :tasklist "%tasklist%" "%param4%"
  if "%action%" == "func" call :echolog "File not found! %testfile%"     & call :%param3% "%param4%" "%param5%"
  if "%action%" == "createfile" call :echolog "File not found! %testfile%" Create empty file.    & echo. > "%testfile%"
  if "%action%" == "fatal" (
  call :echolog "File not found! %message%"
  echo %message%
  echo The script will end.
  echo.
  pause
  goto :eof
  )

)
if defined masterdebug call :funcdebug %0 endgoto :eof


