:main
:: Description: Starting point of pub.cmd
:: Class: command - internal - startup
:: Optional parameters:
:: Required functions:
:: funcdebugstart
:: funcdebugend
:: choosegroup
rem set the codepage to unicode to handle special characters in parameters
if "%PUBLIC%" == "C:\Users\Public" (
      rem if "%PUBLIC%" == "C:\Users\Public" above is to prevent the following command running on Windows XP
      if not defined skipsettings chcp 65001
)
rem 
call :pubtypetest
echo.
	if not defined skipsettings echo                       Vimod-Pub
	if not defined skipsettings echo     Various inputs multiple outputs digital publishing
if "%pubtype%" == "solo" (
	if not defined skipsettings echo         https://github.com/SILAsiaPub/vimod-pub-solo
) else if "%pubtype%" == "global" (
	if not defined skipsettings echo       https://github.com/silasiapub/vimod-pub-global
) else	if "%pubtype%" == "classic" (
	if not defined skipsettings echo       https://github.com/silasiapub//vimod-pub
)
echo    ----------------------------------------------------
if defined masterdebug call :funcdebugstart main
set debug=%1
if defined debug echo on
call :setup
if exist "project.process" call :tasklist project.process
call :menu "%projectsetuppath%\project.menu"
if defined masterdebug call :funcdebugend
goto :eof


