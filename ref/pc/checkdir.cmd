



:checkdir
:: Description: checks if dir exists if not it is created
:: Required preset variabes: 1
:: projectlog
:: Optional preset variables:
:: echodirnotfound
:: Required parameters: 1
:: dir
:: Required functions:
:: funcdebugstart
:: funcdebugend
if defined masterdebug call :funcdebugstart checkdir
set dir=%~1
if not defined dir echo Path parameter empty or not supplied; Can't check path! 
if not defined dir echo ???????????????????????????????????????????????????????????????& goto :eof
set report=Checking dir %dir%
if exist %dir% (
      echo . . . Found! %dir% >>%projectlog%
) else (
    call :removecommonatstart dirout "%dir%"
    if defined echodirnotfound echo Creating . . . %dirout%
    echo . . . not found. %dir% >>%projectlog%
    echo mkdir %dir% >>%projectlog%
    mkdir "%dir%"
)
if defined masterdebug call :funcdebugendgoto :eof


