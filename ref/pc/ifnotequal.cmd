

:ifnotequal
:: Description: to do something on the basis of two items being equal
:: Required Parameters:
:: equal1
:: equal2
:: func
:: funcparams
set equal1=%~1
set equal2=%~2
set func=%~3
set funcparams=%~4
if defined funcparams set funcparams=%funcparams:'="%
if "%equal1%" neq "%equal2%" call :%func% %funcparams%goto :eof


