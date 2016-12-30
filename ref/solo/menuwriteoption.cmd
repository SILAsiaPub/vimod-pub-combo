

:menuwriteoption
:: Description: writes menu option to screen
:: Class: command - internal - menu
:: Required preset variable: 1
:: leters
:: action
:: Required parameters: 1
:: menuitem
:: checkfunc
:: submenu
set menuitem=%~1
set checkfunc=%~2
set submenu=%~3
rem check for common menu
if /%checkfunc%/ == /commonmenu/ (
  call :%action%
  exit /b
)
rem check for menublank
if /%checkfunc%/ == /menublank/ (
  echo.
  if defined submenu echo           %submenu%
  if defined submenu echo.
  exit /b
)
rem write the menu item
set let=%letters:~0,1%
if "%let%" == "%stopmenubefore%" goto :eof
      echo        %let%. %menuitem%
set letters=%letters:~1%
rem set the option letter
set option%let%=%action%
rem make the letter list
set menuoptions=%let% %menuoptions%goto :eof


