

:looptasks
:: Description: loop through tasks acording to %list%
:: Class: command
:: Optional preset variables:
:: list
:: comment
:: Required parameters:
:: tasklistfile
:: list
:: comment
:: Depends on:
:: funcdebug
:: tasklist
if defined masterdebug call :funcdebug %0
set tasklistfile=%~1
if not defined list set list=%~2
if not defined comment set comment=%~3
if not defined tasklistfile echo Missing tasklistfile parameter & goto :eof
if not defined list echo Missing list parameter & goto :eof
echo "%comment%"
FOR /F %%s IN (%list%) DO call :tasklist "%tasklistfile%" %%s
set list=
set comment=
echo =====^> end looptasks
if defined masterdebug call :funcdebug %0 endgoto :eof


