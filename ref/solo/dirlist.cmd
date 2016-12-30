

:dirlist
:: Description: Creates a directory list in a file
:: Class: Command - external
:: Required functions:
:: dirpath
:: dirlist - a file path and name
echo on
set dirpath=%~1
set dirlist=%~2
dir /b "%dirpath%" > "%dirlist%"
echo offgoto :eof


