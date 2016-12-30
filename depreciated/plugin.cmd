:plugin
:: Depreciated: not used. Just create a tasklist to cusmoize a new file-operator
:: Description: used to access external plugins
:: Class: command - external - extend
:: Optional preset variables:
:: outputdefault
:: Required parameters:
:: action
:: Optional parameters:
:: pluginsubtask
:: params
:: infile
:: outfile
:: Depends on:
:: infile
:: outfile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
call :inccount
set plugin=%~1
set pluginsubtask=%~2
set params=%~3
rem if (%params%) neq (%params:'=%) set params=%params:'="%
if defined params set params=%params:'="%
call :infile "%~4"
call :outfile "%~5" "%outputdefault%"
set curcommand=call plugins\%plugin%
call :before
%curcommand%
call :after "%plugin% plugin complete"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


