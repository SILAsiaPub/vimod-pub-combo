


:infile
:: Description: If infile is specifically set then uses that else uses previous outfile.
:: Class: command - internal - pipeline - parameter
:: Required parameters:
:: testinfile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set testinfile=%~1
if "%testinfile%" == "" (
set infile=%outfile%
) else (
set infile=%testinfile%
)
if not exist "%infile%" set missinginput=on
if exist "%infile%" set missinginput=
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


