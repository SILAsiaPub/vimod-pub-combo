


rem ============================================== Menuing and control functions
:menu
:: Description: starts a menu
:: Class: command - menu
:: Required parameters:
:: newmenulist
:: title
:: forceprojectpath
:: Required functions:
:: funcdebugstart
:: variableslist
:: checkifvimodfolder
:: menuwriteoption

if defined masterdebug call :funcdebugstart menu
set errorlevel=
set newmenulist=%~1
set title=%~2
set forceprojectpath=%~3
set skiplines=%~4
set tempprojectpath=%~dp1
if '%pubtype%' == 'classic' set projectpath=%tempprojectpath:~0,-7%
if '%pubtype%' == 'classic' set projectsetuppath=%tempprojectpath:~0,-1%
if '%pubtype%' == 'global' set projectpath=%tempprojectpath:~0,-1%
if '%pubtype%' == 'global' set projectsetuppath=%projectpath%
if '%pubtype%' == 'solo' set projectpath=%tempprojectpath:~0,-1%
if '%pubtype%' == 'solo' set projectsetuppath=%projectpath%
set projectpathbackslash=%projectpath%\
set prevprojectpath=%projectpath%
if not defined newmenulist set newmenulist=%menulist%
set prevmenu=%menulist%
set letters=%lettersmaster%
set tasklistnumb=
set count=0
set varvalue=
set errorsuspendprocessing=
if defined echomenuparams echo menu params=%~0 "%~1" "%~2" "%~3" "%~4"
::call :ext %newmenulist%
rem detect if projectpath should be forced or not
if defined forceprojectpath (
    if defined echoforceprojectpath echo forceprojectpath=%forceprojectpath%
    set projectpath=%forceprojectpath%
    if '%pubtype%' == 'classic' set projectsetuppath=%forceprojectpath%\setup
    if '%pubtype%' == 'global' set projectsetuppath=%forceprojectpath%
    if '%pubtype%' == 'solo' set projectsetuppath=%forceprojectpath%
    if exist "%pubsetuppath%\%newmenulist%" (
            set menulist=%pubsetuppath%\%newmenulist%
            set menutype=settings
    ) else if exist "%pubmenupath%\%newmenulist%" (
            set menulist=%pubmenupath%\%newmenulist%
            set menutype=commonmenutype
    ) else (
    echo No forced path file option found!
    )
) else (
    if defined echoforceprojectpath echo projectpath=%projectpath%
    rem if defined userelativeprojectpath call :removeCommonAtStart projectpath "%projectpathbackslash%"
    echo off
    if exist "%newmenulist%" (
        set menulist=%newmenulist%
        set menutype=projectmenu
    ) else (
        set menutype=createdynamicmenu
        set menulist=created
    )
)
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
if "%menutype%" == "commonmenutype" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "settings" call :writeuifeedback "%menulist%" %skiplines%
if "%menutype%" == "createdynamicmenu" for /F "eol=# delims=" %%i in ('dir "%projectpath%" /b/ad') do (
    set action=menu "%projectpath%\%%i\%classicsetupfolder%\project.menu" "%%i project"
    call :checkifvimodfolder %%i
    if not defined skipwriting call :menuwriteoption %%i
)
if "%menulist%" neq "utilities.menu" (
    if defined echoutilities echo.
    if defined echoutilities echo        %utilityletter%. Utilities
)
echo.
if "%newmenulist%" == "data\%classicsetupfolder%\project.menu" (
    echo        %exitletter%. Exit batch menu
) else (
    if "%newmenulist%" == "%pubmenupath%\utilities.menu" (
      echo        %exitletter%. Return to Groups menu
    ) else (
      echo        %exitletter%. Return to calling menu
    )
)
echo.
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%
IF /I '%Choice%' == '%utilityletter%' call :menu utilities.menu "Utilities Menu" "%projectpath%"
IF /I '%Choice%'=='%exitletter%' (
    if "%menulist%" == "%pubmenupath%\utilities.menu" (
        if 'pubtype' == 'classic' (
            set skipsettings=on
            "%~0"  
        ) else (
            rem echo ...exit menu &exit /b
            set 
            call :menu "%projectpath%\project.menu"
        )
    ) else (
        echo ...exit menu &exit /b
    )
)

:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice
FOR /D %%c IN (%menuoptions%) DO call :menueval %%c
if defined masterdebug call :funcdebugendgoto :menu


