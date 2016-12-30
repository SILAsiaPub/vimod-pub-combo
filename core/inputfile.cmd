:inputfile
:: Description: Sets the starting file of a serial tasklist, by assigning it to the var outfile
:: Class: command - variable
:: Optional preset variables:
:: writebat
:: projectbat
:: Required parameters:
:: outfile
:: Added handling so that a preset var %writebat%, will cause the item to be written to a batch file
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set outfile=%~1
if not defined outfile echo missing outfile parameter & goto :eof
if "%writebat%" == "yes" echo set outfile=%~1 >>%projectbat%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


