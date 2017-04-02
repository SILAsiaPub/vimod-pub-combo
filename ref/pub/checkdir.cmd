


:checkdir
:: Description: checks if dir exists if not it is created
:: See also: ifnotexist
:: Required preset variabes:
:: projectlog
:: Optional preset variables:
:: echodirnotfound
:: Required parameters:
:: dir
:: Depends on:
:: funcdebugstart
:: funcdebugend
if defined masterdebug call :funcdebug %0
set dir=%~1
if not defined dir echo missing required directory parameter & goto :eof
set report=Checking dir %dir%
if exist "%dir%" (
      echo . . . Found! %dir% >>%projectlog%
) else (
    if defined echodirnotfound echo Creating . . . %dir:~-20%
    echo . . . not found. %dir% >>%projectlog%
    echo mkdir %dir% >>%projectlog%
    mkdir "%dir%"
)
if defined masterdebug call :funcdebug %0 end
goto :eof


