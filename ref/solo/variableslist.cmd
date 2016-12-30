

:variableslist
:: Description: Handles variables list supplied in a file.
:: Class: command - loop
:: Optional preset variables:
:: selvalue - used to set a value equals itself ie set ccw32=ccw32 from just ccw32. Used for path tools
:: echovariableslist
:: echoeachvariablelistitem
:: Required parameters:
:: list - a filename with name=value on each line of the file
:: checktype - for use with ifnotexist
:: Required functions:
:: drivepath
:: nameext
:: ifnotexist
if defined echovariableslist echo ==== Processing variable list %~1 ==== &@echo on
set list=%~1
rem set checktype=%~2
rem make sure testvalue is not set
rem set testvalue=
FOR /F "eol=# delims== tokens=1,2" %%s IN (%list%) DO set %%s=%%t
if defined echovariableslist echo offgoto :eof


