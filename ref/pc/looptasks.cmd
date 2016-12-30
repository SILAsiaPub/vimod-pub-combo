

:looptasks
:: Description: loop through tasks acording to %list%
:: Class: command
:: Required parameters: 1
:: tasklistfile
:: list
:: comment
if defined masterdebug call :funcdebugstart looptasks
set tasklistfile=%~1
set list=%~2
set comment=%~3
echo "%comment%"
FOR /F %%s IN (%list%) DO call :tasklist "%tasklistfile%" %%s
set list=
set comment=
echo =====^> end looptasks
if defined masterdebug call :funcdebugendgoto :eof


