

:dirlist
:: Description: Creates a directory list in a file
:: Class: Command - external
:: Required functions:
:: dirpath
:: dirlist - a file path and name
set dirpath=%~1
set dirlist=%~2
dir /b "%dirpath%" > "%dirlist%"goto :eof


