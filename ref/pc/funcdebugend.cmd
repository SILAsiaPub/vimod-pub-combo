

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
call :var return %%%returnhandle%%%
set returnfunc=debug%return%
set newfunc=%returnfunc%
if defined echofuncname echo %return%
@echo off
if defined returnfunc @echo on
if defined nodebugoffatend @echo ongoto :eof


