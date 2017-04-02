

:funcdebug
:: Description: Debug function run at the start of a function
:: Class: command - internal - debug
:: Required parameters:
:: entryfunc
@echo off
@if defined debugfuncdebug @echo on
set entryfunc=%~1
set debugend=%~2
if not defined entryfunc echo entryfunc is missing, skipping this function & goto :eof
set testfunc=debug%entryfunc:~1%
if "%debugend%" == "end" (
  set debugstack=%debugstack:~1%
  set nextdebug=%debugstack:~0,1%
  if defined masterdebug @echo %endfuncstring% %~1 %debugstack%
  if '%nextdebug%' == '1' (@echo on) else (@echo off)
) else (
  if defined %testfunc% set debugstack=1%debugstack%
  if not defined %testfunc% set debugstack=0%debugstack%
  if defined masterdebug @echo %beginfuncstring% %~1  %debugstack% %beginfuncstringtail%
  if "%debugstack:~0,1%" == "1" (@echo on) else (@echo off)
)goto :eof


