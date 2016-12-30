:tasklists
:: Description: run serial tasklists
:: Required parameters:
:: list
:: Note: The list must have extension
set list=%~1
call :loopstring tasklist "%list%"
goto :eof


