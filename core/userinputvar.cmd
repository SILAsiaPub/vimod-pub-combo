:userinputvar
:: Description: provides method to interactively input a variable
:: Class: command - interactive
:: Required parameters:
:: varname
:: question
:: Depends on:
:: funcdebug
if defined masterdebug call :funcdebug %0
set varname=%~1
set question=%~2
set /P %varname%=%question%:
if defined masterdebug call :funcdebug %0 end
goto :eof


