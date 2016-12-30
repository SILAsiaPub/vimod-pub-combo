

rem inc is included so that an xslt transformation can also process this tasklist. Not all tasklists may need processing into params.
:inc
:: Depreciated: use tasklist
call :tasklist "%~1"
goto :eof


