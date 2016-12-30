:writeuifeedback
:: Description: Produce a menu from a list to allow the user to change default list settings
:: Class: command - internal - menu
:: Usage: call :writeuifeedback list [skiplines]
:: Required parameters:
:: list
:: Optional parameters:
:: skiplines
:: Depends on:
:: menuwriteoption
rem echo on
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set list=%~1
set skiplines=%~2
if not defined skiplines set skiplines=1
FOR /F "eol=# tokens=1 skip=%skiplines% delims==" %%i in (%list%) do (
    if defined %%i (
          set action=var %%i
          call :menuwriteoption "ON  - Turn off %%i?"
    ) else (
          set action=var %%i on
          call :menuwriteoption "    - Turn on  %%i?"
    )
)
rem echo off
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


