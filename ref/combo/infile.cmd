


:infile
:: Description: If infile is specifically set then uses that else uses previous outfile.
:: Class: command - internal - pipeline - parameter
:: Required parameters: 1
:: testinfile
set testinfile=%~1
if not defined testinfile (
set infile=%outfile%
) else (
set infile=%testinfile%
)
call :ext "%infile%"
call :ifnotexist "%infile%" suspend "Input %ext%"goto :eof


