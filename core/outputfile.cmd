:outputfile
:: Description: Copies last out file to new name. Used to make a static name other tasklists can use.
:: Class: command
:: Required preset variables:
:: outfile
:: Required parameters:
:: newfilename
:: Func calls:
:: inccount
:: drivepath
:: nameext
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebug %0
call :inccount
set infile=%outfile%
set filename=%~1
call :drivepath "%filename%"
call :nameext "%filename%"
set outfile=%drivepath%%nameext%
set curcommand=copy /Y "%infile%" "%outfile%"
call :before off
%curcommand%
call :after "Copied "%infile%" to "%outfile%"
if defined masterdebug call :funcdebug %0 end
goto :eof


