

:spaceremove
set string=%~1
set spaceremoved=%string: =%
if defined masterdebug call :funcdebug %0goto :eof


