



:copyresources
:: Description: Copies resources from resource folder to traget folder
:: Class: command - project setup
:: Required parameters:
:: resourcename
:: resourcetarget
:: 2013-08-15
rem echo on
set resourcename=%~1
set resourcetarget=%~2
if not defined resourcename echo resourcename not defined
if not defined resourcetarget echo resourcetarget not defined
xcopy /e/y "%pubresourcespath%\%resourcename%" "%resourcetarget%"
rem echo offgoto :eof


