

:testjava
:: Description: Test if java is installed. Attempt to use local java.exe otherwise it will exit with a warning.

set javainstalled=
where java /q
if "%errorlevel%" ==  "0" set javainstalled=yes
rem if defined JAVA_HOME set javainstalled=yes
if not defined javainstalled (
      if exist %altjre% (
            set java=%altjre%
      ) else (
            echo No java found installed nor was java.exe found inVimod-Pub tools\java folder.
            echo Please install Java on your machine.
            echo Get it here: http://www.java.com/en/download/
            echo The program will exit after this pause.
            pause
            exit /b
      )
) else (
      set java=java
)goto :eof


