

:loopfileset
:: Description: Loops through a list of files supplied by a file.
:: Class: command - loop
:: Required parameters:
:: action
:: fileset
:: comment
:: Note: 
:: Either preset or command parameters can be used
:: Depends on:
:: funcdebug
:: * - Maybe any function but most likely a tasklist
if defined masterdebug call :funcdebug %0
set action=%~1
set fileset=%~2
set comment=%~3
if not defined action echo Missing action parameter & goto :eof
if not defined fileset echo Missing fileset parameter & goto :eof
if defined comment echo %comment%
FOR /F %%s IN (%fileset%) DO call :%action% %%s
if defined masterdebug call :funcdebug %0 endgoto :eof


