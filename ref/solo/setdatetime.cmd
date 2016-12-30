


:setdatetime
:: Description: generate a XML style date and time similar to gedattime
:: Class: command - internal - date - time
:: Required parameters:
::echo Setup log
set actno=1
set tenhour=%time:~0,1%
if "%tenhour%" == " " (
set myhour=0%time:~1,1%
) else (
set myhour=%time:~0,2%
)
set datetime=%date:~-4,4%-%date:~-7,2%-%date:~-10,2%T%myhour%%time:~3,2%%time:~6,2%goto :eof


