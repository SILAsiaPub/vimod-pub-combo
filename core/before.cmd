:before
:: Description: Checks if outfile exists, renames it if it does. Logs actions.
:: Class: command - internal
:: Required preset variables:
:: projectlog
:: projectbat
:: curcommand
:: Optional preset variables:
:: outfile
:: curcommand
:: writebat
:: Optional variables:
:: echooff
:: Func calls: 
:: funcdebugstart
:: funcdebugend
:: nameext
rem @echo on
set echooff=%~1
if defined masterdebug call :funcdebug %0
if defined echocommandtodo echo Command to be attempted:
if defined echocommandtodo echo %curcommand%
if not defined echooff echo "Command to be attempted:" >>%projectlog%
echo "%curcommand%" >>%projectlog%
if defined writebat echo %curcommand%>>%projectbat%
echo. >>%projectlog%
if exist "%outfile%" call :nameext "%outfile%"
if exist "%outfile%.pre.txt" del "%outfile%.pre.txt"
if exist "%outfile%" ren "%outfile%" "%nameext%.pre.txt"
set echooff=
rem @echo off
if defined masterdebug call :funcdebug %0 end
goto :eof


