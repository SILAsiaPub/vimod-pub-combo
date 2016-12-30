


:menuvaluechooser
:: Description: Will write menu lines from a menu file in the commonmenu folder
:: Class: command - internal - menu
:: Used by: menu
:: Required parameters:
:: commonmenu
rem echo on
set list=%~1
set menuoptions=
set option=
set letters=%lettersmaster%
echo.
echo %title%
echo.
FOR /F %%i in (%pubmenupath%\%list%) do call :menuvaluechooseroptions %%i
echo.
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%

:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice
    echo on
FOR /D %%c IN (%menuoptions%) DO call :menuvaluechooserevaluation %%c
echo off
echo outside loop
rem call :menuevaluation %%c
echo %valuechosen%
pause
if "%varvalue%" == "set" exit /bgoto :eof


