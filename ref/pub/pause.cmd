

:pause
:: Description: Pauses work until user interaction
:: Class: command - user interaction
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
pause
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


