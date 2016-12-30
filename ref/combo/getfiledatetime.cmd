

:getfiledatetime
:: Description: Returns a variable with a files modification date and time in yyMMddhhmm  similar to setdatetime. Note 4 digit year makes comparison number too big for batch to handle.
:: Revised: 2016-05-04
:: Classs: command - internal - date -time
:: Required parameters:
:: varname
:: filedate - (supply the file name and path)
rem echo on
set varname=%~1
set filedate=%~t2
if not exist "%~2" set %varname%=0 &goto :eof
rem got and mofified this from: http://www.robvanderwoude.com/datetiment.php#IDate
FOR /F "tokens=1-6 delims=:%dateseparator% " %%A IN ("%~t2") DO (
  IF "%dateformat%"=="0" (
      SET fdd=%%B
      SET fmm=%%A
      SET fyyyy=%%C
    )
  IF "%dateformat%"=="1" (
      SET fdd=%%A
      SET fmm=%%B
      SET fyyyy=%%C
  )
  IF "%dateformat%"=="2" (
      SET fdd=%%C
      SET fmm=%%B
      SET fyyyy=%%A
)
  set fnn=%%E
  call :hour %%F %%D
)
set %varname%=%fyyyy:~2%%fMM%%fdd%%fhh%%fnn%goto :eof


