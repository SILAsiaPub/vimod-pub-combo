



rem shift
rem shift
rem set extraparam=
rem if ""%~1""=="""" goto :ifNotDefinedDoneStart
rem set extraparam='%~1'
rem shift
rem :ifNotDefinedArgs
rem if ""%1""=="""" goto :ifNotDefinedDoneStart
rem set extraparam=%extraparam% '%1'
rem shift
rem goto :ifNotdefinedArgs
rem :ifNotDefinedDoneStart
rem set extraparam=%extraparam:'="%

:externalfunctions
:: Description: non-conditional based on defined variable
:: Class: command - extend - external
:: Required parameters:
:: extcmd
:: function
:: params
:: Required functions:
:: inccount
:: infile
:: outfile
:: before
:: after
call :inccount
set extcmd=%~1
set function=%~2
set params=%~3
call :infile "%~4"
call :outfile "%~5" "%outputdefault%"
set curcommand=call %extcmd% %function% "%params%" "%infile%" "%outfile%"
call :before
%curcommand%
call :after "externalfunctions %function% complete"goto :eof


