:cct
:: Description: Privides interface to CCW32.
:: Required preset variables:
:: ccw32
:: Optional preset variables:
:: Required parameters:
:: script - can be one script.cct or serial comma separated "script1.cct,script2.cct,etc"
:: Optional parameters:
:: infile
:: outfile
:: Depends on:
:: infile
:: outfile
:: inccount
:: before
:: after
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebug %0
set script=%~1
if not defined script echo CCT missing! & goto :eof
call :infile "%~2"
if defined missinginput echo missing input file & goto :eof
if not exist "%ccw32%" echo missing ccw32.exe file & goto :eof
set scriptout=%script:.cct,=_%
call :inccount
call :outfile "%~3" "%projectpath%\xml\%pcode%-%count%-%scriptout%.xml"
set basepath=%cd%
rem if not defined ccw32 set ccw32=ccw32
set curcommand="%ccw32%" %cctparam% -t "%script%" -o "%outfile%" "%infile%"
call :before
cd %cctpath%
%curcommand%
cd %basepath%
call :after "Consistent Changes"
::
if defined masterdebug call :funcdebug %0 end
goto :eof


