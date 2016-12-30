

:outfile
:: Description: If out file is specifically set then uses that else uses supplied name.
:: Class: command - internal - pipeline- parameter
:: Required parameters: 2
:: testoutfile
:: defaultoutfile
set testoutfile=%~1
set defaultoutfile=%~2
if "%testoutfile%" == "" (
set outfile=%defaultoutfile%
) else (
set outfile=%testoutfile%
)goto :eof


