

:outfile
:: Description: If out file is specifically set then uses that else uses supplied name.
:: Class: command - internal - pipeline- parameter
:: Required parameters:
:: testoutfile
:: defaultoutfile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set testoutfile=%~1
set defaultoutfile=%~2
if "%testoutfile%" == "" (
set outfile=%defaultoutfile%
) else (
set outfile=%testoutfile%
)
call :drivepath "%outfile%"
call :checkdir "%drivepath%"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


