

:var-classic
:: Description: classic pub variables
set pubpath=%cd%
set projectpath=%pubpath%\data
set projectsetuppath=%pubpath%\data\setup
set vimodvar=%pubsetuppath%\vimod.variables
set essentialtools=%pubsetuppath%\essential_installed.tools
set userinstalledtools=%pubsetuppath%\user_installed.tools
set userfeedbacksettings=%pubsetuppath%\user_feedback.settings
set functiondebugsettings=%pubsetuppath%\functiondebug.settings
if defined echovarclassic echo Classic variables loaded

set blankxml=%pubpath%\blank.xml
set pubsetuppath=%pubpath%\%classicsetupfolder%
set pubtoolspath=%pubpath%\tools
rem Global VimodPub key folders
set pubtaskspath=%pubpath%\tasks
set pubmenupath=%pubpath%\menus
set pubcctpath=%pubpath%\scripts\cct
set pubxsltpath=%pubpath%\scripts\xslt
set pubresourcespath=%pubpath%\resources

goto :eof


