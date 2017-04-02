

:ifnotdefined
:: Description: non-conditional based on defined variable
:: Class: command - condition
:: Required parameters:
:: test
:: func
:: Optional parametes:
:: funcparams
:: Depends on:
:: * - Maybe any function but likely tasklist
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set test=%~1
set func=%~2
set funcparams=%~3
if not defined test echo missing test parameter & goto :eof
if not defined func echo missing func parameter & goto :eof
if defined funcparams set funcparams=%funcparams:'="%
if not defined %test% call :%func% %funcparams%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


