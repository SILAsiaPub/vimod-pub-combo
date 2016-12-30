



:quoteinquote
:: Description: Resolves single quotes withing double quotes. Surrounding double quotes dissapea, singles be come doubles.
:: Class: command - internal - parameter manipulation
:: Required parameters:
:: varname
:: paramstring
set varname=%~1
set paramstring=%~2
if defined paramstring set %varname%=%paramstring:'="%goto :eof


