

:html2xml
:: Description: Convert HTML to xml for post processing as xml. it removes the doctype header.
:: Required external program: HTML Tidy in variable %tidy5%
:: Required parameters:
:: infile
:: Optional Parameters:
:: outfile
call :infile "%~1"
call :outfile "%~2"
set curcommand=call xml fo -H -D "%infile%"
rem set curcommand=call "%tidy5%" -o "%outfile%" "%infile%"
call :before
%curcommand% > "%outfile%"
call :aftergoto :eof


