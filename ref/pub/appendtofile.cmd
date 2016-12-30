


:appendtofile
:: Description: Func to append text to a file or append text from another file
:: Class: command
:: Optional predefined variables:
:: newfile
:: Required parameters:
:: file
:: text
:: quotes
:: filetotype
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set file=%~1
if not defined file echo file parameter not supplied &goto :eof
set text=%~2
set quotes=%~3
set filetotype=%~5
if not defined newfile set newfile=%~4
if defined quotes set text=%text:'="%
if not defined filetotype (
  if defined newfile (
    echo %text%>%file%
  ) else (
    echo %text%>>%file%
  )
) else (
  if defined newfile (
    type "%filetotype%" > %file%
  ) else (
    type "%filetotype%" >> %file%
  )
)
set newfile=
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


