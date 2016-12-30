

:validatevar
:: validate variables passed in
set testvar=%~1
if not defined %testvar:"=% (
            echo No %~1 var found defined
            echo Please add this to the %classicsetupfolder%\user_installed.tools
            echo The program will exit after this pause.
            pause
            exit /b
      )goto :eof


