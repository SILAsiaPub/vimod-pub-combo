

:html2xml
:: Description: Convert HTML to xml for post processing as xml. it removes the doctype header.
:: Required external program: HTML Tidy in variable %tidy5%
:: Required parameters:
:: infile
:: Optional Parameters:
:: outfile
:: Depends on:
:: infile
:: outfile
:: before
:: after
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
call :infile "%~1"
if defined missinginput echo missing input file & goto :eof
call :outfile "%~2"
set curcommand=call xml fo -H -D "%infile%"
rem set curcommand=call "%tidy5%" -o "%outfile%" "%infile%"
call :before
%curcommand% > "%outfile%"
call :after
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


