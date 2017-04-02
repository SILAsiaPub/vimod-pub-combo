:menu
:: Description: starts a menu
:: Revised: 2016-05-04
:: Class: command - menu
:: Required parameters:
:: newmenulist
:: title
:: forceprojectpath
:: Depends on:
:: funcdebug
:: ext
:: removeCommonAtStart
:: menuwriteoption
:: writeuifeedback
:: checkifvimodfolder
:: menu
:: menueval
set debugstack=0
if defined masterdebug call :funcdebug %0
set newmenulist=%~1
set title=%~2
set errorlevel=
set forceprojectpath=%~3
set skiplines=%~4
set defaultprojectpath=%~dp1
set defaultjustprojectpath=%~p1
set prevprojectpath=%projectpath%
set prevmenu=%menulist%
set letters=%lettersmaster%
set tasklistnumb=
set count=0
set varvalue=
if defined echomenuparams echo menu params=%~0 "%~1" "%~2" "%~3" "%~4"
::call :ext %newmenulist%
rem detect if projectpath should be forced or not
if defined forceprojectpath (
    if defined echoforceprojectpath echo forceprojectpath=%forceprojectpath%
    set setuppath=%forceprojectpath%\%projectsetupfolder%
    set projectpath=%forceprojectpath%
    if exist "setup-pub\%newmenulist%" (
            set menulist=setup-pub\%newmenulist%
            set menutype=settings
    ) else (
            set menulist=%commonmenufolder%\%newmenulist%
            set menutype=commonmenutype
    )
) else (

    if defined echoforceprojectpath echo forceprojectpath=%forceprojectpath%
    set projectpathbackslash=%defaultprojectpath:~0,-6%
    set projectpath=%defaultprojectpath:~0,-7%
    if defined userelativeprojectpath call :removeCommonAtStart projectpath "%projectpathbackslash%"
    set setuppath=%defaultprojectpath:~0,-1%
    rem echo off
    if exist "%newmenulist%" (
        set menulist=%newmenulist%
        set menutype=projectmenu
    ) else (
          set menutype=createdynamicmenu
          set menulist=created
    )
)
if defined breakpointmenu1 pause
if defined echomenulist echo menulist=%menulist%
if defined echomenutype echo menutype=%menutype%
if defined echoprojectpath echo %projectpath%
rem ==== start menu layout =====
set title=                     %~2
set menuoptions=
echo.
echo %title%
if defined echomenufile echo menu=%~1
if defined echomenufile echo menu=%~1
echo.
rem process the menu types to generate the menu items.
if "%menutype%" == "projectmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i" %%j
if "%menutype%" == "commonmenutype" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i" %%j
if "%menutype%" == "settings" call :writeuifeedback "%menulist%" %skiplines%
if "%menutype%" == "createdynamicmenu" for /F "eol=# delims=" %%i in ('dir "%projectpath%" /b/ad') do (
    set action=menu "%projectpath%\%%i\%projectsetupfolder%\project.menu" "%%i project"
    call :checkifvimodfolder %%i
    if not defined skipwriting call :menuwriteoption %%i
)
if "%menulist%" neq "utilities.menu" (
    if defined echoutilities echo.
    if defined echoutilities echo        %utilityletter%. Utilities
)
echo.
if defined breakpointmenu2 pause
if "%newmenulist%" == "data\%projectsetupfolder%\project.menu" (
    echo        %exitletter%. Exit batch menu
) else (
    if "%newmenulist%" == "%commonmenufolder%\utilities.menu" (
      echo        %exitletter%. Return to Groups menu
    ) else (
      echo        %exitletter%. Return to calling menu
    )
)
echo.
rem SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
rem The syntax in the next line extracts the substring
rem starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%' == '%utilityletter%' call :menu utilities.menu "Utilities Menu" "%projectpath%"
IF /I '%Choice%'=='%exitletter%' (
    if "%menulist%" == "%commonmenufolder%\utilities.menu" (
      set skipsettings=on
      pub
    ) else (
        echo ...exit menu &goto :eof
    )
)

:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice
if defined breakpointmenu3 pause
FOR /D %%c IN (%menuoptions%) DO call :menueval %%c
if defined masterdebug call :funcdebug %0 end
goto :menu


