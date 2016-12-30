

:cct
:: Description: Privides interface to CCW32.
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
if defined debugcct echo on
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebugstart cct
set script=%~1
call :infile "%~2"
if defined errorsuspendprocessing goto :eof
set scriptout=%script:.cct,=_%
call :inccount
call :outfile "%~3" "%projectpath%\xml\%pcode%-%count%-%scriptout%.xml"
set curpath=%cd%
rem if not defined ccw32 set ccw32=ccw32
set curcommand=%ccw32% %cctparam% -t "%script%" -o "%outfile%" "%infile%"
call :before
call :drive "%pubcctpath%"
%drive%
cd %pubcctpath%
%curcommand%
call :drive "%curpath%"
%drive%
cd %curpath%
call :after "Consistent Changes"
::
if defined masterdebug call :funcdebugend
if defined debugcct echo offgoto :eof


