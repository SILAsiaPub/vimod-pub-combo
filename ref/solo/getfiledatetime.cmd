

:getfiledatetime
:: Description: Returns a variable with a files modification date and time in yyyyMMddhhmm  similar to setdatetime
:: Classs: command - internal - date -time
:: Required parameters:
:: varname
:: filedate - (supply the file name and path)
rem echo on
set varname=%~1
set filedate=%~t2
if not exist "%~2" set %varname%=0 &goto :eof
set prehour=%filedate:~11,2%
if "%filedate:~17,2%" == "PM" (
  if "%prehour:~0,1%" == "0"  (
    rem adding 05 + 12 caused error but 5+12 okay
    set dhour=%prehour:~1,1%
    set /A fhour=%prehour:~1,1%+12
  ) else (
    if %prehour% == 12 (
      rem if noon don't add 12
      set fhour=12
    ) else (
      set /A fhour=%prehour% + 12
    )
  )
) else (
  set fhour=%prehour%
)
set %varname%=%filedate:~8,2%%filedate:~3,2%%filedate:~0,2%%fhour%%filedate:~14,2%
@echo offgoto :eof


