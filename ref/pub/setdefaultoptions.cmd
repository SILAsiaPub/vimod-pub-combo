

:setdefaultoptions
:: Description: Sets default options if not specifically set
:: class: command - parameter - fallback
:: Required parameters:
:: testoption
:: defaultoption
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set testoption=%~1
set defaultoption=%~2
if "%testoption%" == "" (
  set options=%defaultoption%
) else (
set options=%testoption%
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


