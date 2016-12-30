


:menu-new
:: Description: starts a menu
:: Class: command - menu
:: Required parameters:
:: newmenulist
:: title
:: Optional parameters:
:: changeprojectpath
:: skiplines
:: Required functions:
:: funcdebugstart
:: variableslist
:: checkifvimodfolder
:: menuwriteoption
if defined masterdebug call :funcdebugstart menu
set errorlevel=
set newmenulist=%~1
set title=%~2
set changeprojectpath=%~3
set skiplines=%~4
rem set defaultprojectpath=%~dp1
rem set defaultjustprojectpath=%~p1
set prevprojectpath=%projectpath%
set prevmenu=%menulist%
set letters=%lettersmaster%
set tasklistnumb=
set count=0
set varvalue=
set errorsuspendprocessing=
if defined echomenuparams echo menu params=%~0 "%~1" "%~2" "%~3" "%~4"
::call :ext %newmenulist%
rem detect if projectpath should be forced or not
if defined echochangeprojectpath echo changeprojectpath=%changeprojectpath%
if defined changeprojectpath (
    if exist "%newprojectpath%\setup\project.menu" (
        rem classic menu match
        set menutype=projectnmenu
        set projectpath=%changeprojectpath%
        if '%pubtype%' == 'classic' (
            set menulist=%changeprojectpath%\setup\%newmenulist%
        ) else (
            set menulist=%changeprojectpath%\%newmenulist%
        )
    ) else (
        set menutype=createdynamicmenu
        set projectpath=%changeprojectpath%
    )
) else (
    rem handle menus related to pub or project
    if exist "%projectsetuppath%\%newmenulist%" (
        rem handle classic, global or solo menus
        set menulist=%projectsetuppath%\%newmenulist%
        set menutype=projectmenu
    ) else if exist "%pubsetuppath%\%newmenulist%" (
        set menulist=%pubsetuppath%\%newmenulist%
        set menutype=settings
    ) else if exist "%pubmenupath%\%newmenulist%" (
        set menulist=%pubmenupath%\%newmenulist%
        set menutype=projectmenu
    ) else if '%newmenulist%' == 'utilities2.menu' ( 
        set menulist=%pubmenupath%\%newmenulist%
        set menutype=pubmenu
    ) else if exist "%projectsetuppath%\project.menu" ( 
        set menulist=%pubmenupath%\%newmenulist%
        set menutype=pubmenu
    ) else (
          set menutype=createdynamicmenu
    )
)
if defined echomenulist echo menulist=%menulist%
if defined echomenutype echo menutype=%menutype%
if defined echoprojectpath echo %projectpath%
rem ==== start menu layout =====
set title=                     %~2
rem echo   %projectpath%
set menuoptions=
echo.
echo %title%
if defined echomenufile echo menu=%~1
if defined echomenufile echo menu=%~1
echo.
rem process the menu types to generate the menu items.
if "%menutype%" == "projectmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i" %%j
if "%menutype%" == "pubmenu" FOR /F "eol=# tokens=1,2 delims=;" %%i in (%menulist%) do set action=%%j&call :menuwriteoption "%%i"
if "%menutype%" == "settings" call :writeuifeedback "%menulist%" %skiplines%
if "%menutype%" == "createdynamicmenu" for /F "eol=# delims=" %%i in ('dir "%projectpath%" /b/ad') do (
    set action=menu "project.menu" "%%i project" "%projectpath%\%%i"
    call :checkifvimodfolder %%i
    if not defined skipwriting call :menuwriteoption %%i
)
if "%menulist%" neq "utilities.menu" (
    if defined echoutilities echo.
    if defined echoutilities echo        %utilityletter%. Utilities
)
echo.
if "%menulist%" == "project.menu" (
    echo        %exitletter%. Exit batch menu
) else (
    if "%menulist%" == "utilities2.menu" (
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
rem ============================================================================
rem process the built in menu options
if /I '%Choice%'=='%exitletter%' (
    if "%menulist%" == "utilities2.menu" (
      goto :menu
    ) else if '%pubtype%' == 'classic' (
        rem handle classic folder heirachy
        cd "%projectpath%"
        cd ..
        set parentpath=%cd%
        cd "%basepath%"
        call :menu "" "Choose?" "%parentmenu%"
    ) else if '%menulist%' == 'project.menu' (
        rem handle global and solo menus
        if '%basepath%' == '%projectpath%' echo ...exit menu &exit
    ) else (
        echo ...exit menu &exit /b
    )
) else IF /I '%Choice%' == '%utilityletter%' (
    call :menu utilities2.menu "Utilities Menu"
)

rem Loop to evaluate the input and start the correct process.
rem the following line processes the choice
FOR /D %%c IN (%menuoptions%) DO call :menueval %%c
if defined masterdebug call :funcdebugendgoto :menu


