


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
:: Depends on:
:: drivepath
:: nameext
:: ifnotexist
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
if defined echovariableslist echo ==== Processing variable list %~1 ====
set list=%~1
set checktype=%~2
rem make sure testvalue is not set
set testvalue=
FOR /F "eol=# delims== tokens=1,2" %%s IN (%list%) DO (
    set name=
    set val=
    rem selfvalue is set to let a value equal itself like in user_path_installed.tools
    if not defined selfvalue (
    set %%s=%%t
    ) else (
    set %%s=%%s
    )
    if defined echoeachvariablelistitem echo %%s=%%t
    if defined checktype (
        call :drivepath %%t
        rem the following tests if the value is a path
        if "%drivepath%" neq "%cd%" (
            rem seems redundant call :nameext %%t
            call :ifnotexist "%%t" %checktype% "%nameext% tool not found in %drivepath%."
            )
        )
    )
if defined selfvalue set selfvalue=
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


