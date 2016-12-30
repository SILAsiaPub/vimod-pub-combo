

:md5create
:: no current use
:: Description: Make a md5 check file
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
call fciv "%~1" >"%~2"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


