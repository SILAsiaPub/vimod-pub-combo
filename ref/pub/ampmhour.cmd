

:ampmhour
:: Description: Converts AM/PM time to 24hour format. Also splits
:: Created: 2016-05-04 
:: Used by: getfiledatetime 
:: Required parameters:
:: ampm
:: thh
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set ampm=%~1
set thh=%~2
if "%ampm%" == "AM" (
  if "%thh%" == "12" (
    set fhh=00
  ) else (
    set fhh=%thh%
  )
) else if "%ampm%" == "PM" (
  if "%thh%" == "12" (
    set fhh=12
  ) else (
    rem added handling to prevent octal number error caused by leading zero
    if "%thh:~0,1%" == "0" set /A fhh=%thh:~-1%+12
    if "%thh:~0,1%" neq "0" set /A fhh=%thh%+12
  )
) else  (
  set fhh=%thh%
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


