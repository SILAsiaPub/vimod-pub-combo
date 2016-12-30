

:hour
:: Description: Converts AM/PM time to 24hour format. Also splits
:: Created: 2016-05-04 used by revised :getfiledatetime 
:: Required parameters:
:: ampm
:: thh
set ampm=%~1
set thh=%~2
if "%ampm%" == "AM"  (
  if "%thh%" == "12" (
    set fhh=24
  ) else (
    set fhh=%thh%
  )
) else if "%ampm%" == "PM" (
  if "%thh%" == "12" (
    set fhh=12
  ) else (
    set /A fhh=%thh%+12
  )
) else (
  set fhh=%thh%
)goto :eof


