


:menucountedevaluate
:: Class: command - internal
if defined varvalue goto :eof
set evalcount=%~1
set let=%letters:~0,1%
IF /I '%Choice%'=='%let%' call :getline %evalcount% "%list%"
IF /I '%Choice%'=='%let%' set varvalue=set
IF /I '%Choice%'=='%let%' set valuechosen=%getline%&set option& exit /b
set letters=%letters:~1%goto :menu


