

:file2uri
:: Description: transforms dos path to uri path. i.e. c:\path\file.ext to file:///c:/path/file.ext  not needed for XSLT
:: Class: command - parameter manipulation
:: Required parameters:  1
:: pathfile
:: Optional parameters:
:: number
:: created variables: 1
:: uri%number%
if defined masterdebug call :funcdebugstart file2uri
call :setvar pathfile "%~1"
set numb=%~2
set uri%numb%=file:///%pathfile:\=/%
set return=file:///%pathfile:\=/%
if defined echofile2uri call :echolog       uri%numb%=%return:~0,25% . . . %return:~-30%
if defined masterdebug call :funcdebugendgoto :eof


