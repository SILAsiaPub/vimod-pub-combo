

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
if /%checkfunc%/ == /commonmenu/ (
    rem check for common menu
    call :%action%
    set notdisplay=on
    exit /b
) else if /%checkfunc%/ == /menublank/ (
    rem check for menublank
    echo.
    if defined submenu echo           %submenu%
    if defined submenu echo.
    set notdisplay=on
    exit /b
)
rem the following should not be put in 'if' braces
if not defined notdisplay set let=%letters:~0,1%
if not defined notdisplay if "%let%" == "%stopmenubefore%" goto :eof
rem write the menu item
if not defined notdisplay echo        %let%. %menuitem%
if not defined notdisplay set letters=%letters:~1%
rem set the option letter
if not defined notdisplay set option%let%=%action%
rem make the letter list
if not defined notdisplay set menuoptions=%let% %menuoptions%
goto :menu


