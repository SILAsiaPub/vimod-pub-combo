

:var-classic
:: Description: classic pub variables
set pubpath=%cd%
set projectpath=%pubpath%\data
set projectsetuppath=%pubpath%\data\setup
set blankxml=%pubpath%\blank.xml
set pubsetuppath=%pubpath%\%classicsetupfolder%
rem classic Vimod-Pub
set pubtoolspath=%pubpath%\tools
rem Global VimodPub key folders
set pubtaskspath=%cd%\tasks
set pubmenupath=%cd%\menus
set pubcctpath=%cd%\scripts\cct
set pubxsltpath=%cd%\scripts\xslt
set pubresourcespath=%cd%\resources
set vimodvar=%pubsetuppath%\vimod.variables
set essentialtools=%pubsetuppath%\essential_installed.tools
set userinstalledtools=%pubsetuppath%\user_installed.tools
set userfeedbacksettings=%pubsetuppath%\user_feedback.settings
set functiondebugsettings=%pubsetuppath%\functiondebug.settings
if defined echovarclassic echo Classic variables loadedgoto :eof


