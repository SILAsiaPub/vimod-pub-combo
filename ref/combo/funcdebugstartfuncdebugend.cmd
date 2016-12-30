

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
:: Modified: 2016-04
:: Class: command - internal - debug
:: Required preset variables:
:: debugstack
@echo off
set entryfunc=%~1
set debugstack=%debugstack:~1%
set nextdebug=%debugstack:~0,1%
if defined masterdebug @echo -------------------------------------- end func %~1  %debugstack%
if '%nextdebug%' == '1' echo ongoto :eof


