

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
if defined %test% echo ongoto :eof


