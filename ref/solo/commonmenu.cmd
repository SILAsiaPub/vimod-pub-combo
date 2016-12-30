

:commonmenu
:: Description: Will write menu lines from a menu file in the %commonmenufolder% folder
:: Class: command - menu
:: Used by: menu
:: Required parameters:
:: commonmenu
set commonmenu=%~1
FOR /F "eol=# tokens=1,2 delims=;" %%i in (%commonmenufolder%\%commonmenu%) do set action=%%j&call :menuwriteoption "%%i"goto :eof


