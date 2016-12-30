:runloop
:: Description: run loop with parameters
:: Class: command - loop - depreciated
:: Depends on:
:: * - May be any loop type
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set looptype=%~1
set action=%~2
set string=%~3
set fileset=%~3
set list=%~3
set comment=%~4
set string=%string:'="%
call :%looptype%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof




