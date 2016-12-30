

:getdatetime
:: Description: Returns a variable with current date and time in yyyy-MM-ddThh:mm  similar to setdatetime
:: Revised: 2016-05-04
:: Classs: command - internal - date -time
:: Required preset variables:
:: dateformat
:: dateseparator
:: Required parameters:
:: varname
:: filedate (supply the file name and path)
set varname=%~1
rem got this from: http://www.robvanderwoude.com/datetiment.php#IDate
FOR /F "tokens=1-4 delims=%dateseparator% " %%A IN ("%date%") DO (
    IF "%dateformat%"=="0" (
        SET fdd=%%C
        SET fmm=%%B
        SET fyyyy=%%D
    )
    IF "%dateformat%"=="1" (
        SET fdd=%%B
        SET fmm=%%C
        SET fyyyy=%%D
    )
    IF "%dateformat%"=="2" (
        SET fdd=%%D
        SET fmm=%%C
        SET fyyyy=%%B
    )
)
set %varname%=%fyyyy%-%fMM%-%fdd%T%time%
goto :eof


