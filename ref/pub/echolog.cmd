

:echolog
:: Description: echoes a message to log file and to screen
:: Class: command - internal
:: Required preset variables:
:: projectlog
:: Required parameters:
:: message
:: Depends on:
:: funcdebug
if defined masterdebug call :funcdebug %0
set message=%~1 %~2 %~3 %~4 %~5 %~6 %~7 %~8 %~9
if defined echoecholog echo %message%
echo %curdate%T%time% >>%projectlog%
echo %message% >>%projectlog%
set message=
if defined masterdebug call :funcdebug %0 endgoto :eof


