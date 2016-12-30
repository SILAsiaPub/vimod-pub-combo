


:copy
:: Description: Provides copying with exit on failure
:: Required preset variables:
:: ccw32
:: Optional preset variables:
:: Required parameters:
:: script - can be one script.cct or serial comma separated "script1.cct,script2.cct,etc"
:: Optional parameters:
:: infile
:: outfile
:: appendfile
:: Depends on:
:: infile
:: outfile
:: inccount
:: before
:: after
if defined masterdebug call :funcdebug %0
call :infile "%~1"
set appendfile=%~3
if defined missinginput echo missing input file & goto :eof
call :inccount
call :outfile "%~2"
if defined appendfile (
  set curcommand=copy /y "%outfile%"+"%infile%" "%outfile%" 
) else (
  set curcommand=copy /y "%infile%" "%outfile%" 
)
call :before
%curcommand%
call :after Copy Changes"
if defined masterdebug call :funcdebug %0 endgoto :eof


