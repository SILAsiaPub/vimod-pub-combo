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
    )goto :eof


