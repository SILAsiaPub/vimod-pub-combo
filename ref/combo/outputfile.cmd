


:outputfile
:: Description: Copies last out file to new name. Used to make a static name other tasklists can use.
:: Class: command
:: Required preset variables: 1
:: outfile
:: Required parameters: 1
:: newfilename
:: Func calls: 3
:: inccount
:: drivepath
:: nameext
if defined errorsuspendprocessing goto :eof
if defined masterdebug call :funcdebugstart outputfile
rem removed because :command will inc count call :inccount
set infile=%outfile%
set filename=%~1
call :command "copy /Y '%infile%' '%filename%'" "" "%filename%"
if defined masterdebug call :funcdebugendgoto :eof


