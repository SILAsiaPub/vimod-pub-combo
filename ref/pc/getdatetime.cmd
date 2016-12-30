

:getdatetime
:: Description: Returns a variable with a files modification date and time in yyyyMMddhhmm  similar to setdatetime
:: Classs: command - internal - date -time
:: Required parameters:
:: varname
:: filedate (supply the file name and path)
set varname=%~1
call :date
set %varname%=%curdate%T%time%goto :eof


