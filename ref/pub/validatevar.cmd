

:validatevar
:: validate variables passed in
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set testvar=%~1
if not defined testvar (
            echo No %~1 var found defined
            echo Please add this to the setup-pub\user_installed.tools
            echo The program will exit after this pause.
            pause
            goto :eof
      )
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


