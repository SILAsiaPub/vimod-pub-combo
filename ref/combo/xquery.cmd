

:xquery
:: Description: Provides interface to xquery by saxon9.jar
:: Required preset variables: 1
:: java
:: saxon9
:: Required parameters: 1
:: scriptname
:: Optional parameters: 3
:: allparam
:: infile
:: outfile
:: Func calls: 6
:: inccount
:: infile
:: outfile
:: quoteinquote
:: before
:: after
:: created: 2013-08-20
if defined masterdebug call :funcdebugstart xquery
set scriptname=%~1
set allparam=%~2
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%writecount%-%scriptname%.xml"
call :inccount
set script=scripts\xquery\%scriptname%.xql
call :quoteinquote param "%allparam%"
set curcommand="%java%" net.sf.saxon.Query -o:"%outfile%" -s:"%infile%" "%script%" %param%
call :before
%curcommand%
call :after "XQuery transformation"
if defined masterdebug call :funcdebugendgoto :eof


