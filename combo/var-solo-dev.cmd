

:var-solo-dev
:: Description: solo pub project
set blankxml=%cd%\pub\blank.xml
set projectpath=%cd%
set pubpath=%cd%
set projectsetuppath=%cd%
rem Global VimodPub key folders
set pubsetuppath=%cd%\setup
set pubtoolspath=%cd%\tools
set pubcctpath=%cd%\scripts\cct
set pubxsltpath=%cd%\scripts\xslt
set pubtaskspath=%cd%\tasks
set pubmenupath=%cd%\menus
set pubresourcespath=%cd%\resources
set vimodvar=%pubsetuppath%\vimod.var
set userinstalledtools=%pubsetuppath%\user_installed_tools.var
set userfeedbacksettings=%pubsetuppath%\user_feedback_settings.var
set functiondebugsettings=%pubsetuppath%\function_debug_settings.var
if defined echovarsolodev echo Solo-dev variables loadedgoto :eof


