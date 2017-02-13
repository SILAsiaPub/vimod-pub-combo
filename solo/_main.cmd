::                     Global Pub Solo ver 0.01
@echo off
if "%1" == "debug" echo on
:menutest
:: Description: Tests if project menu exists in current folder
if exist project.menu (
    call :main
) else (
    echo No pub menu found in this folder.
    echo The script will exit
    goto :eof
    )
goto :eof

 :main
 :: Description: Start main part of program
 rem set the codepage to unicode to handle special characters in parameters
if "%PUBLIC%" == "C:\Users\Public" (
      rem if "%PUBLIC%" == "C:\Users\Public" above is to prevent the following command running on Windows XP
      if not defined skipsettings chcp 65001
      )
echo.
if not defined skipsettings echo                       Vimod-Pub Solo
if not defined skipsettings echo     Various inputs multiple outputs digital publishing
if not defined skipsettings echo        http://github.com/SILAsiaPub/vimod-pub-solo
echo    ----------------------------------------------------
call :setup
call :menu project.menu "Choose option?"
goto :eof