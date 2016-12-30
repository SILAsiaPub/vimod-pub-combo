

:ifnotequal
:: Description: to do something on the basis of two items being equal
:: Required Parameters:
:: equal1
:: equal2
:: func
:: funcparams
:: Depends on:
:: * - Maybe any function but likely tasklist
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set equal1=%~1
set equal2=%~2
set func=%~3
set funcparams=%~4
if not defined equal1 echo missing equal1 parameter & goto :eof
if not defined equal2 echo missing equal2 parameter & goto :eof
if not defined func echo missing func parameter & goto :eof
if defined funcparams set funcparams=%funcparams:'="%
if "%equal1%" neq "%equal2%" call :%func% %funcparams%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


