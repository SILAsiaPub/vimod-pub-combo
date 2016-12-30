:command
:: Description: A way of passing any commnand from a tasklist. It does not use infile and outfile.
:: Usage: call :usercommand "copy /y 'c:\patha\file.txt' 'c:\pathb\file.txt'" ["path to run  command in"   "output file to test for"]
:: Limitations: When command line needs single quote.
:: Required parameters:
:: curcommand
:: Optional parameters:
:: commandpath
:: testoutfile
:: Depends on:
:: funcdebugstart
:: funcdebugend
:: inccount
:: echolog
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebug %0
call :inccount
set curcommand=%~1
if not defined curcommand echo missing curcommand & goto :eof
set commandpath=%~2
set testoutfile=%~3
if defined testoutfile set outfile=%testoutfile%
set curcommand=%curcommand:'="%
echo %curcommand%>>%projectlog%
set drive=%~d2
if not defined drive set drive=c:
if defined testoutfile (
  rem the next line 'if "%commandpath%" neq "" %drive%'' must be set with a value even if it is not used or cmd fails. Hence the two lines before this if statement
  if "%commandpath%" neq "" %drive%
  if defined commandpath cd "%commandpath%"
  call :before
  %curcommand%
  call :after
  if defined commandpath cd "%basepath%"
) else (
  if defined echousercommand echo %curcommand%
  %curcommand%
)
if defined masterdebug call :funcdebug %0 end
goto :eof


