

:pubtypetest
:: Description: Tests if project menu exists in current folder
set classicsetupfolder=setup-pub
if exist project.menu (
    if exist "%cd%\pub\setup\vimod.var" (
        set pubtype=solo
    ) else if exist "%cd%\setup\vimod.var" (
	    set pubtype=solo-dev 
    ) else if exist "project.process" (
        set pubtype=global
    )
) else if exist "%cd%\%classicsetupfolder%" (
	set pubtype=classic
) else (
    echo No pub folder system types found.
    echo The script will exit
    goto :eof
)
echo pubtype=%pubtype%goto :eof


