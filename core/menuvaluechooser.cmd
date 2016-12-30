:menuvaluechooser
:: Description: Will write menu lines from a menu file in the commonmenu folder
:: Class: command - internal - menu
:: Used by: menu
:: Required parameters:
:: commonmenu
:: Depends on:
:: menuvaluechooseroptions
:: menuvaluechooserevaluation
:: menuevaluation
rem echo on
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set list=%~1
set menuoptions=
set option=
set letters=%lettersmaster%
echo.
echo %title%
echo.
FOR /F %%i in (%commonmenupath%\%list%) do call :menuvaluechooseroptions %%i
echo.
rem SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
rem The syntax in the next line extracts the substring
rem starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%

rem Loop to evaluate the input and start the correct process.
rem the following line processes the choice
rem    echo on
FOR /D %%c IN (%menuoptions%) DO call :menuvaluechooserevaluation %%c
echo off
echo outside loop
rem call :menuevaluation %%c
echo %valuechosen%
pause
if "%varvalue%" == "set" goto :eof
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%
goto :eof


