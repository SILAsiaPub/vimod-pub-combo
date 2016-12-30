


:copy
:: Description: Provides copying with exit on failure
:: Required preset variables:
:: ccw32
:: Optional preset variables:
:: Required parameters:
:: script - can be one script.cct or serial comma separated "script1.cct,script2.cct,etc"
:: Optional parameters: 2
:: infile
:: outfile
:: Required functions:
:: infile
:: outfile
:: inccount
:: before
:: after
if defined masterdebug call :funcdebugstart copy
call :infile "%~1"
call :inccount
call :outfile "%~2"
set curcommand=copy /y "%infile%" "%outfile%" 
call :before
%curcommand%
call :after Copy Changes"
::
if defined masterdebug call :funcdebugendgoto :eof


