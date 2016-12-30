:after
:: Description: Checks if outfile is created. Reports failures logs actions. Restors previous output file on failure.
:: Class: command - internal
:: Required preset variables:
:: outfile
:: projectlog
:: writecount
:: Optional parameters:
:: report3
:: message
:: Func calls:
:: nameext
if defined masterdebug call :funcdebug %0
@rem @echo on
set message=%~1
call :nameext "%outfile%"
if not exist "%outfile%" (
    set errorlevel=1
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  >>%projectlog%
    echo %message% failed to create %nameext%.                           >>%projectlog%
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  >>%projectlog%
    echo. >>%projectlog%
    echo.
    color E0
    echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    echo %message% failed to create %nameext%.
    if not defined nopauseerror (
        echo.
        echo Read error above and resolve issue then try again.
        echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        echo.
        pause
        echo.
        set errorsuspendprocessing=true
    )
    if defined nopauseerror echo xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    color 07
) else (
    if defined echoafterspacepre echo.
    call :echolog %writecount% Created:   %nameext%

    if defined echoafterspacepost echo.
    echo ---------------------------------------------------------------- >>%projectlog%
    rem echo. >>%projectlog%
    if exist "%outfile%.pre.txt" del "%outfile%.pre.txt"
)
@rem @echo off
if defined masterdebug call :funcdebug %0 end
goto :eof


