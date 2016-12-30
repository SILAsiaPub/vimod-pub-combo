:externalfunctions
:: Depreciated: can't find usage
:: Description: non-conditional based on defined variable
:: Class: command - extend - external
:: Required parameters:
:: extcmd
:: function
:: params
:: Depends on:
:: inccount
:: infile
:: outfile
:: before
:: after
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
call :inccount
set extcmd=%~1
if not defined extcmd echo Missing extcmd parameter & goto :eof
set function=%~2
set params=%~3
call :infile "%~4"
call :outfile "%~5" "%outputdefault%"
set curcommand=call %extcmd% %function% "%params%" "%infile%" "%outfile%"
call :before
%curcommand%
call :after "externalfunctions %function% complete"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


