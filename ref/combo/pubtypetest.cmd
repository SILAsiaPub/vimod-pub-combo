

:pubtypetest
:: Description: Tests if it should operate in Classic, Global or Solo mode
set classicsetupfolder=setup-pub
if exist project.menu (
    if exist "%cd%\pub\" (
        set pubtype=solo
rem    ) else if exist "%cd%\setup\vimod.var" (
rem	    set pubtype=solo-dev 
    ) else if exist "project.process" (
        set pubtype=global
    ) else (
    echo Unknown pub type. Pub will exit
    exit /b
    )
) else if exist "%cd%\%classicsetupfolder%" (
	set pubtype=classic
) else (
    echo No pub folder system types found.
    echo The script will exit
    goto :eof
)
echo pubtype=%pubtype%goto :eof


