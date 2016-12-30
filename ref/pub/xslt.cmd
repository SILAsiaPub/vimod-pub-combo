


:xslt
:: Description: Provides interface to xslt2 by saxon9.jar
:: Required preset variables:
:: java
:: saxon9
:: Required parameters:
:: scriptname
:: Optional parameters:
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
if defined masterdebug call :funcdebug %0
call :inccount
set script=%xsltpath%\%~1.%xslt-ext%
call :ifnotexist "%script%" suspend "XSLT script"
set param=
set allparam=
set allparam=%~2
if defined allparam set param=%allparam:'="%
call :infile "%~3"
call :outfile "%~4" "%projectpath%\xml\%pcode%-%count%-%~1.xml"
set trace=
if defined echojavatrace set trace=-t
if not defined resolvexhtml (
      set curcommand="%java%" -jar "%cd%\%saxon9%" -o:"%outfile%" "%infile%" "%script%" %param%

) else (
      set curcommand="%java%" %loadcat%=%cat% net.sf.saxon.Transform %trace% %usecatalog1% %usecatalog2% -o:"%outfile%" "%infile%" "%script%" %param%
)
call :before
%curcommand%
call :after "XSLT transformation"
if defined masterdebug call :funcdebug %0 end
goto :eof


