

:menucountedwriteline
:: Class: command - internal
if defined endoflist goto :eof
set menucount=%~1
set let=%letters:~0,1%
rem set value%let%=%~1
call :getline %menucount% "%list%"
if "%getline%" == "" set endoflist=eol
if "%getline%" neq "" echo        %let%. %getline%&set getline=
set letters=%letters:~1%goto :menu


