

:menucountedwriteitem
:: Class: command - internal
if defined echomenucountedwriteitem echo on
set item=%~1
set let=%letters:~0,1%
set /A menucount=%menucount%+1
echo        %let%. %item%
set letters=%letters:~1%
@echo offgoto :eof


