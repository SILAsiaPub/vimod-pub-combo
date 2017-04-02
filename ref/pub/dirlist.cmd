

:dirlist
:: Description: Creates a directory list in a file
:: Depreciated: not in current usage
:: Class: Command - external
:: Depends on:
:: dirpath
:: dirlist - a file path and name
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set dirpath=%~1
if not defined dirpath echo missing dirpath input & goto :eof
set dirlist=%~2
dir /b "%dirpath%" > "%dirlist%"
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


