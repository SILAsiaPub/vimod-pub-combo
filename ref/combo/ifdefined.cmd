

:ifdefined
:: Description: conditional based on defined variable
:: Class: command - condition
:: Required parameters:
:: test
:: func
:: funcparams - up to 7 aditional
:: Required functions:
:: tasklist
set test=%~1
set func=%~2
rem set func=%func:'="%
set funcparams=%~3
if defined funcparams set funcparams=%funcparams:'="%
if defined %test% call :%func% %funcparams%goto :eof


