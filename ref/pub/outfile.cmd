

:outfile
:: Description: If out file is specifically set then uses that else uses supplied name.
:: Class: command - internal - pipeline- parameter
:: Required parameters:
:: testoutfile
:: defaultoutfile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set testoutfile=%~1
set defaultoutfile=%~2
if defined testoutfile(
  set outfile=%testoutfile%
) else if defined (
set outfile=%defaultoutfile%
) else (
  set outfile=%projectpath%\xml\temp.xml
)
call :drivepath "%outfile%"
call :checkdir "%drivepath%"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


