

:inputfile
:: Description: Sets the starting file of a serial tasklist, by assigning it to the var outfile
:: Class: command - variable
:: Optional preset variables: 2
:: writebat
:: projectbat
:: Required parameters: 1
:: outfile
:: Added handling so that a preset var %writebat%, will cause the item to be written to a batch file
set outfile=%~1
if "%writebat%" == "yes" echo set outfile=%~1 >>%projectbat%goto :eof


