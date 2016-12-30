

:var-solo
:: Description: solo pub project
set projectpath=%cd%
set projectsetuppath=%cd%
set pubpath=%cd%\pub
set blankxml=%pubpath%\blank.xml
rem Global VimodPub key folders
set pubsetuppath=%cd%\pub\setup
set pubtoolspath=%pubpath%\tools
set pubcctpath=%pubpath%\scripts\cct
set pubxsltpath=%pubpath%\scripts\xslt
set pubtaskspath=%pubpath%\tasks
set pubmenupath=%pubpath%\menus
set pubresourcespath=%pubpath%\resources
set vimodvar=%pubsetuppath%\vimod.var
set userinstalledtools=%pubsetuppath%\user_installed_tools.var
set userfeedbacksettings=%pubsetuppath%\user_feedback_settings.var
set functiondebugsettings=%pubsetuppath%\function_debug_settings.var
if defined echovarsolo echo Solo variables loadedgoto :eof


