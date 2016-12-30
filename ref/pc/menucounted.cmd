

:menucounted
:: Description: Another way of creating a menu
:: Class: command - internal
set list=%commonmenufolder%\%~1
set menuoptions=
set varvalue=
set valuechosen=
set letters=%lettersmaster%
set menucount=0
echo.
echo %title%
echo.
FOR /F %%i in (%list%) do call :menucountedwriteitem %%i
rem FOR /L %%i in (2,1,35) do call :menucountedwriteline %%i
echo.
:: SET /P prompts for input and sets the variable to whatever the user types
SET Choice=
SET /P Choice=Type the letter and press Enter: 
:: The syntax in the next line extracts the substring
:: starting at 0 (the beginning) and 1 character long
IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%

:: Loop to evaluate the input and start the correct process.
:: the following line processes the choice

set letters=%lettersmaster%
FOR /L %%i in (1,1,34) DO call :menucountedevaluate %%i

rem call :menuevaluation %%c
if defined echomenucountedvaluechosen echo %valuechosen%
rem echo off
if "%varvalue%" == "set" exit /bgoto :eof


