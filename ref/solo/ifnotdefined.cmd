

:ifnotdefined
:: Description: non-conditional based on defined variable
:: Class: command - condition
:: Required parameters:
:: test
:: func
:: Optional parametes:
:: funcparams
set test=%~1
set func=%~2
set funcparams=%~3
if defined funcparams set funcparams=%funcparams:'="%
if not defined %test% call :%func% %funcparams%goto :eof


