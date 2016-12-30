


:spinoffproject
:: Description: spinofff a project from whole build system
:: Class: command - condition
:: Required parameters:
:: Created: 2013-08-10
:: depreciated doing with tasks file
:: Depends on:
:: xslt
:: joinfile
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set copytext=%projectpath%\logs\copyresources*.txt
set copybat=%projectpath%\logs\copyresources.cmd
if exist "%copytext%" del "%copytext%"
if exist "%copybat%" del "%copybat%"
echo :: vimod-spinoff-project generated file>>"%copybat%"
if "%~1" == "" (
set outpath=C:\vimod-spinoff-project
) else (
set outpath=%~1
)
if "%~2" neq "" set projectpath=%~2

dir /a-d/b "%projectpath%\*.*">"%projectpath%\logs\files.txt"
call :xslt vimod-spinoff-project "projectpath='%projectpath%' outpath='%outpath%' projfilelist='%projectpath%\logs\files.txt'" scripts/xslt/blank.xml "%projectpath%\logs\spin-off-project-report.txt"
FOR /L %%n IN (0,1,100) DO call :joinfile %%n
if exist "%copybat%" call "%copybat%"
::call :command xcopy "'%projectpath%\*.*' '%outpath%"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


