

:menuvaluechooseroptions
:: Description: Processes the choices
:: Class: command - internal - menu
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set menuitem=%~1
set let=%letters:~0,1%
set value%let%=%~1
if "%let%" == "%stopmenubefore%" goto :eof
      echo        %let%. %menuitem%
set letters=%letters:~1%
rem set the option letter
rem make the letter list
set menuoptions=%menuoptions% %let%
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%goto :eof


