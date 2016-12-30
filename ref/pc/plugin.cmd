

:plugin
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
:: Required functions:
:: infile
:: outfile
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
call :after "%plugin% plugin complete"goto :eof


