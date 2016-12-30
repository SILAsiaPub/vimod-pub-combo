

:variableslist
:: Description: Loads variables from a list supplied in a file.
:: Use: internal
:: Class: command - loop
:: Optional preset variables:
:: echovariableslist
:: echoeachvariablelistitem
:: Required parameters:
:: list - a drive:\path\filename.ext with name=value on each line of the file
if defined echovariableslist echo ==== Processing variable list %~1 ====
set list=%~1
set checktype=%~2
FOR /F "eol=# delims== tokens=1,2" %%s IN (%list%) DO (
    set %%s=%%t
    if defined echoeachvariablelistitem echo %%s=%%t
)goto :eof


