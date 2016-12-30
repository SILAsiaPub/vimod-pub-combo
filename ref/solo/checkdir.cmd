



:checkdir
:: Description: checks if dir exists if not it is created
:: Required preset variabes: 1
:: projectlog
:: Required parameters: 1
:: dir
set dir=%~1
set report=Checking dir %dir%
if exist %dir% (
      echo . . . Found! %dir% >>%projectlog%
) else (
    if defined echodirnotfound echo Creating . . . %dir%
    echo . . . not found. %dir% >>%projectlog%
    echo mkdir %dir% >>%projectlog%
    mkdir "%dir%"
)goto :eof


