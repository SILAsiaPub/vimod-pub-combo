:echo
:: Description: generic handling echo
:: Modified: 2016-05-05
:: Class: command - internal
:: Possible required preset parameters:
:: projectlog
:: Required parameters:
:: echotask or message
:: Optional parameters:
:: message
:: add2file
:: Depends on:
:: funcdebug
if defined masterdebug call :funcdebug %0
set echotask=%~1
if not defined echotask echo Missing echotask parameter & goto :eof
set message=%~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9
if '%echotask%' == 'on' (
  @echo on
) else if '%echotask%' == 'off' (
  @echo off
) else if '%echotask%' == 'add2file' (
  @echo %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9 >> "%add2file%"
) else if '%echotask%' == 'log' (
  if defined echoecholog echo %message%
  echo %curdate%T%time% >>%projectlog%
  echo %message% >>%projectlog%
  set message=                
) else if '%echotask%' == '.' (
  echo.
) else (
  echo %message%
)
if defined masterdebug call :funcdebug %0 end
goto :eof


