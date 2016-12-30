

:getdatetime
:: Description: Returns a variable with a files modification date and time in yyyyMMddhhmm  similar to setdatetime
:: Classs: command - internal - date -time
:: Required parameters:
:: varname
:: filedate (supply the file name and path)
set varname=%~1
set %varname%=%date:~-4,4%-%date:~-7,2%-%date:~-10,2%T%time%goto :eof


