

:inccount
:: Description: iIncrements the count variable
:: Class: command - internal - parameter manipulation
:: Required preset variables:
:: space
:: count - on second and subsequent use
:: Optional preset variables: 1
:: count - on first use
set /A count=%count%+1
set writecount=%count%
if %count% lss 10 set writecount=%space%%count%goto :eof


