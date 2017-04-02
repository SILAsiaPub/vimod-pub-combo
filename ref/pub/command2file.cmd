

:command2file
:: Description: Used with commands that only give stdout, so they can be captued in a file.
:: Usage: call :command2file "copy /y 'c:\patha\file.txt' 'c:\pathb\file.txt'" [[["output file to test for"]   "path to run  command in"] append]
:: Required parameters:
:: command
:: outfile
:: Optional parameters:
:: commandpath
:: Depends on:
:: inccount
:: before
:: after
:: outfile
:: funcdebug
:: Note: This command does its own expansion of single quotes to double quotes so cannont be fed directly from a ifdefined or ifnotdefined. Instead define a task that is fired by the ifdefined.
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebug %0
call :inccount
set command=%~1
set out=%~2
if not defined command echo missing command & goto :eof
call :outfile "%out%" "%projectpath%\xml\%pcode%-%count%-command2file.xml"
set commandpath=%~3
set append=%~4
rem the following is used for the feed back but not for the actual command
if not defined append (
  set curcommand=%command:'="% ^^^> "%outfile%"
) else (
  set curcommand=%command:'="% ^^^>^^^> "%outfile%"
)

call :before
set curcommand=%command:'="%
if "%commandpath%" neq "" (
  set startdir=%cd%
  set drive=%commandpath:~0,2%
  %drive%
  cd "%commandpath%"
)
if not defined append (
  call %curcommand% > "%outfile%"
) else (
  call %curcommand% >> "%outfile%"
)

if "%commandpath%" neq "" (
  set drive=%startdir:~0,2%
  %drive%
  cd "%startdir%"
  set dive=
)
call :after "command with stdout %curcommand% complete"
if defined masterdebug call :funcdebug %0 end
goto :eof


