:removeCommonAtStart
:: Depreciated: probably not needed
:: Description: loops through two strings and sets new variable representing unique data
:: Class: command - internal
:: Required parameters:
:: name - name of the variable to be returned
:: test - string to have common data removed from start
:: Optional parameters:
:: remove - string if not defined then use %cd% as string.
:: Depends on:
:: removelet
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set name=%~1
set test=%~2
set remove=%~3
if not defined remove set remove=%cd%
set endmatch=
FOR /L %%l IN (0,1,100) DO if not defined notequal (
      call :removelet
      ) else (
      goto :eof
      )
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


