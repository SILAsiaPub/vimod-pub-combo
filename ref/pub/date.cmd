

:date
:: Description: Returns multiple variables with date in three formats, the year in wo formats, month and day date.
:: Revised: 2016-05-04
:: Classs: command - internal - date -time
:: Required preset variables:
:: dateformat
:: dateseparator
rem got this from: http://www.robvanderwoude.com/datetiment.php#IDate
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
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
set curdate=%fyyyy%-%fmm%-%fdd%
set curisodate=%fyyyy%-%fmm%-%fdd%
set curyyyymmdd=%fyyyy%%fmm%%fdd%
set curyymmdd=%fyyyy:~2%%fmm%%fdd%
set curUSdate=%fmm%/%fdd%/%fyyyy%
set curAUdate=%fdd%/%fmm%/%fyyyy%
set curyyyy=%fyyyy%
set curyy=%fyyyy:~2%
set curmm=%fmm%
set curdd=%fdd%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


