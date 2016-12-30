



rem External tools functions ===================================================




:xslt
:: Description: Provides interface to xslt2 by saxon9.jar
:: Required preset variables: 1
:: java
:: saxon9
:: Required parameters: 1
:: scriptname
:: Optional parameters: 3
:: allparam
:: infile
:: outfile
:: Func calls:
:: inccount
:: infile
:: outfile
:: quoteinquote
:: before
:: after
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebugstart xslt
call :inccount
set script=%xsltpath%\%~1.%xslt-ext%
call :ifnotexist "%script%" suspend "XSLT script"
set param=
set allparam=
set allparam=%~2
if defined allparam set param=%allparam:'="%
call :infile "%~3"
call :ifnotexist "%infile%" suspend "Input XML"
if defined errorsuspendprocessing goto :eof
call :outfile "%~4" "%projectpath%\xml\%pcode%-%count%-%~1.xml"
if not defined resolvexhtml set resolvexhtml=%~5
set trace=
if defined echojavatrace set trace=-t
if not defined resolvexhtml (
      set curcommand="%java%" -jar "%saxon9%" -o:"%outfile%" "%infile%" "%script%" %param%

) else (
    rem is this working, I think not, but maybe not needed with 9.5 onwards
    set curcommand="%java%" -cp "%pubpath%\tools\saxon\saxon9he.jar;%pubpath%\tools\java\resolver.jar" net.sf.saxon.Transform -o:"%outfile%" "%infile%" "%script%" %param%
)
call :before
%curcommand%
call :after "XSLT transformation"
if defined masterdebug call :funcdebugendgoto :eof


