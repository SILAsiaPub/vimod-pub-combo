

:getline
:: Description: Get a specific line from a file
:: Class: command - internal
:: Required parameters:
:: linetoget
:: file
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
if defined echogetline echo on
set linetoget=%~1
set file=%~2
if not defined linetoget echo missing linetoget parameter & goto :eof
if not defined file echo missing file parameter & goto :eof
set /A count=%~1-1
if "%count%" == "0" (
    for /f %%i in (%~2) do (
        set getline=%%i
        goto :eof
    )
) else (
    for /f "skip=%count% " %%i in (%~2) do (
        set getline=%%i
        goto :eof
    )
)
@echo off
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


