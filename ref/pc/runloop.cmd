

:runloop
:: Description: run loop with parameters
:: Class: command - loop - depreciated
set looptype=%~1
set action=%~2
set string=%~3
set fileset=%~3
set list=%~3
set comment=%~4
set string=%string:'="%
call :%looptype%goto :eof


