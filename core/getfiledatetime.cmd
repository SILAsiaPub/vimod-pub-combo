:getfiledatetime
:: Description: Returns a variable with a files modification date and time in yyMMddhhmm  similar to setdatetime. Note 4 digit year makes comparison number too big for batch to handle.
:: Revised: 2016-05-04
:: Classs: command - internal - date -time
:: Required parameters:
:: varname
:: file
:: Depends on:
:: ampmhour
rem echo on
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set varname=%~1
if not defined varname echo missing varname parameter & goto :eof
set file=%~2
if not exist "%file%" set %varname%=0 &goto :eof
set filedate=%~t2
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
  call :ampmhour %%F %%D
)
set %varname%=%fyyyy:~2%%fMM%%fdd%%fhh%%fnn%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


