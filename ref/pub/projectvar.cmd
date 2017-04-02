


:projectvar
:: Description: get the variables from project.tasks file
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
call :ifexist "%projectpath%\setup\project.tasks" utf-8
call :tasklist project.tasks
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


