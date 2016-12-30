

:command2file
:: Description: Used with commands that only give stdout, so they can be captued in a file.
:: Class: command - dos - to file
:: Required parameters:
:: command
:: outfile
:: Optional parameters:
:: commandpath
:: Required functions:
:: inccount
:: before
:: after
:: Note: This command does its own expansion of single quotes to double quotes so cannont be fed directly from a ifdefined or ifnotdefined. Instead define a task that is fired by the ifdefined.
if defined echocommandstdout echo on
call :inccount
set command=%~1
call :outfile "%~2" "%projectpath%\xml\%pcode%-%count%-command2file.xml"
set commandpath=%~3
rem the following is used for the feed back but not for the actual command
set curcommand=%command:'="% ^^^> "%outfile%"
call :before
set curcommand=%command:'="%
if "%commandpath%" neq "" (
  set startdir=%cd%
  set drive=%commandpath:~0,2%
  %drive%
  cd "%commandpath%"
) 
call %curcommand% > "%outfile%"
if "%commandpath%" neq "" (
  set drive=%startdir:~0,2%
  %drive%
  cd "%startdir%"
  set dive=
)
call :after "command with stdout %curcommand% complete"
if defined masterdebug call :funcdebugendgoto :eof


