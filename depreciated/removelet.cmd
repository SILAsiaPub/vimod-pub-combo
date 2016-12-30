:removelet
:: Depreciated: probably not needed
:: Description: called by removeCommonAtStart to remove one letter from the start of two string variables
:: Class: command - internal
:: Required preset variables:
:: test
:: remove
:: name
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set test=%test:~1%
set %name%=%test:~1%
set remove=%remove:~1%
if "%test:~0,1%" neq "%remove:~0,1%" set notequal=on&goto :eof
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


