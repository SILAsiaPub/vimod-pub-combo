

:var-global
:: Description: global pub project
set projectpath=%cd%
set projectsetuppath=%cd%
set pubpathbackslash=%~dp0
set pubpath=%pubpathbackslash:~0,-1%
set pubsetuppath=%pubpath%\setup
set pubtoolspath=%pubpath%\tools
set projectscriptpath=%pubpath%\scripts
set blankxml=%pubpath%\scripts\blank.xml
set workpath=%pubpath%\work
set pubxsltpath=%workpath%\scripts\xslt
set pubcctpath=%workpath%\scripts\cct
set pubtaskspath=%workpath%\tasks
set pubmenupath=%workpath%\menus
set pubresourcespath=%workpath%\resources
set vimodvar=%pubsetuppath%\vimod.var
set userinstalledtools=%pubsetuppath%\user_installed_tools.var
set userfeedbacksettings=%pubsetuppath%\user_feedback_settings.var
set functiondebugsettings=%pubsetuppath%\function_debug_settings.var
if defined echovarglobal echo Global variables loadedgoto :eof


