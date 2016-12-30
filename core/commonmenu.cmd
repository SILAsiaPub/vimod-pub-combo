:commonmenu
:: Description: Will write menu lines from a menu file in the %commonmenufolder% folder
:: Class: command - menu
:: Used by: menu
:: Required parameters:
:: commonmenu
:: Depends on:
:: menuwriteoption
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set commonmenu=%~1
FOR /F "eol=# tokens=1,2 delims=;" %%i in (%commonmenufolder%\%commonmenu%) do set action=%%j&call :menuwriteoption "%%i" %%j
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%
goto :eof


