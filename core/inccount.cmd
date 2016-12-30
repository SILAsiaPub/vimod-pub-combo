:inccount
:: Description: iIncrements the count variable
:: Class: command - internal - parameter manipulation
:: Required preset variables:
:: space
:: count - on second and subsequent use
:: Optional preset variables:
:: count - on first use
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set /A count=%count%+1
set writecount=%count%
if %count% lss 10 set writecount=%space%%count%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


