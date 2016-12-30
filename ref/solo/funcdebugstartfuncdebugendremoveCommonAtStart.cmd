

:funcdebugstart
:: Description: Debug function run at the start of a function
:: Class: command - internal - debug
:: Required preset variables:
:: stacksource
:: stack - created upon first usage
:: Required parameters:
:: newfunc
@echo off
@if defined debugfuncdebugstart @echo on
if defined echodebugmarker @echo +++++++++++++++++++++++++++++++++++++++++ starting func %~1 ++++
if "%ewfunc%" == "%~1" set nodebugoffatend=
set newfunc=%~1
::@echo stacksource=%stacksource%
set /A stacknumb=%stacknumb%+1
if defined debugstack @echo stacknumb=%stacknumb%
set sn%stacknumb%=%newfunc%
rem @echo off
set test=debug%newfunc%
if defined %test% echo on
@goto :eof

:funcdebugend
:: Description: Debug function run at the end of a function. Resets the calling functions debugging echo state
:: Class: command - internal - debug
:: Required preset variables:
:: stacksource
:: stack
@echo off
if defined echodebugmarker @echo --------------------------------------------- %newfunc% func ended. ----
if defined funcdebugend echo on
set /A stacknumb=%stacknumb%-1
set returnhandle=sn%stacknumb%
call :setvar return %%%returnhandle%%%
set returnfunc=debug%return%
set newfunc=%returnfunc%
if defined echofuncname echo %return%
@echo off
if defined returnfunc @echo on
if defined nodebugoffatend @echo on
@goto :eof

:removeCommonAtStart
:: Description: loops through two strings and sets new variable representing unique data
:: Class: command - internal
:: Required parameters:
:: name - name of the variable to be returned
:: test - string to have common data removed from start
:: Optional parameters:
:: remove - string if not defined then use %cd% as string.
:: Required functions:
:: removelet
set name=%~1
set test=%~2
set remove=%~3
if not defined remove set remove=%cd%
set endmatch=
FOR /L %%l IN (0,1,100) DO if not defined notequal (
      call :removelet
      ) else (
      exit /b
      )goto :eof


