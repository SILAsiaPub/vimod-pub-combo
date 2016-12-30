:menuwriteoption
:: Description: writes menu option to screen
:: Class: command - internal - menu
:: Required preset variable:
:: letters
:: action
:: Required parameters:
:: menuitem
:: checkfunc
:: submenu
:: Depends on:
:: * - Could call any function but most likely tasklist
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set menuitem=%~1
set checkfunc=%~2
set submenu=%~3
rem check for common menu
if /%checkfunc%/ == /commonmenu/ (
  call :%action%
  goto :eof
) else if /%checkfunc%/ == /menublank/ ( 
 rem check for menublank
  call :%action%
  goto :eof
) 
rem write the menu item
set let=%letters:~0,1%
if "%let%" == "%stopmenubefore%" goto :eof
      echo        %let%. %menuitem%
set letters=%letters:~1%
rem set the option letter
set option%let%=%action%
rem make the letter list
set menuoptions=%let% %menuoptions%
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%
goto :eof


