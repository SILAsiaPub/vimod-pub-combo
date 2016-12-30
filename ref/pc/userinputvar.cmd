


:userinputvar
:: Description: provides method to interactively input a variable
:: Class: command - interactive
:: Required parameters: 2
:: varname
:: question
if defined masterdebug call :funcdebugstart userinputvar
set varname=%~1
set question=%~2
set /P %varname%=%question%:
if defined masterdebug call :funcdebugendgoto :eof


