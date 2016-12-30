:start
:: Description: Start a file in the default program or supply the program and file
:: Required parameters:
:: var1
:: Optional parameters:
:: var2
:: var3
:: var4
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set var1=%~1
set var2=%~2
set var3=%~3
set var4=%~4
if defined var1 (
  if "%var1%" == "%var1: =%" (
   start "%var1%" "%var2%" "%var3%" "%var4%"
  ) else (
   start "" "%var1%" "%var2%" "%var3%" "%var4%"
  )
) else (
  start "%var1%" "%var2%" "%var3%" "%var4%"
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


