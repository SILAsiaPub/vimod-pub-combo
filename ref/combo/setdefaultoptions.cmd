

:setdefaultoptions
:: Description: Sets default options if not specifically set
:: class: command - parameter - fallback
:: Required parameters:
:: testoption
:: defaultoption
set testoption=%~1
set defaultoption=%~2
if "%testoption%" == "" (
  set options=%defaultoption%
) else (
set options=%testoption%
)goto :eof


