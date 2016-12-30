

:processreset
:: Discription: clear files from work folder
rem echo on
del /s/q "%pubpath%\work\"
call :process vimod-base
rem echo offgoto :eof


