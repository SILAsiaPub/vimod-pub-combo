

:process
:: Discription: copies a processes resources to the working folder
:: Use: Pub-Global; project.process
set processname=%~1
rem Global VimodPub key folders
xcopy /s "%pubpath%\processes\%processname%\*.*" "%pubpath%\work"
if exist "%pubpath%\work\*.xslt" move /y  "%pubpath%\work\*.xslt" "%pubpath%\work\scripts\xslt\"
if exist "%pubpath%\work\*.cct" move /y  "%pubpath%\work\*.cct" "%pubpath%\work\scripts\cct\"
if exist "%pubpath%\work\*.tasks" move /y  "%pubpath%\work\*.tasks" "%pubpath%\work\tasks\"
if exist "%pubpath%\work\*.menu" move /y  "%pubpath%\work\*.menu" "%pubpath%\work\menus\"goto :eof


