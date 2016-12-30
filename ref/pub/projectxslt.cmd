

:projectxslt
:: Description: make project.xslt from project.tasks
:: Required preset variables:
:: projectpath
:: Depends on:
:: getdatetime
:: xslt
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
set makenewprojectxslt=
call :getfiledatetime tasksdate "%projectpath%\setup\project.tasks"
call :getfiledatetime xsltdate "%cd%\scripts\xslt\project.xslt"
call :getfiledatetime xsltscriptdate "%cd%\scripts\xslt\vimod-projecttasks2variable.xslt"
rem firstly check if this is the last project run
if "%lastprojectpath%" == "%projectpath%" (
  rem then check if the project.tasks is newer than the project.xslt
  set /A tasksdate-=%xsltdate%
  if "%tasksdate%" GTR "%xsltdate%" (
    rem if the project.tasks is newer then remake the project.xslt
    echo  project.tasks newer: remaking project.xslt %tasksdate% ^> %xsltdate%
    echo.
    set makenewprojectxslt=on
  ) else (
    if "%xsltscriptdate%" GTR "%xsltdate%" (
      echo.
      echo vimod-projecttasks2variable.xslt is newer. %xsltscriptdate% ^> %xsltdate% project.xslt
      echo Remaking project.xslt
      echo.
      set makenewprojectxslt=on
    ) else (
      call :inccount
      rem nothing has changed so don't remake project.xslt
      echo 1 project.xslt is newer. %xsltdate% ^> %tasksdate% project.tasks
      rem echo     Project.tasks  ^< %xsltdate% project.xslt.
      echo.
    )
  )
) else (
  rem the project is not the same as the last one or Vimod has just been started. So remake project.xslt
  if defined lastprojectpath echo Project changed from "%lastprojectpath:~37%" to "%projectpath:~37%"
  if not defined lastprojectpath echo New session for project: %projectpath:~37%
  echo.
  echo Remaking project.xslt
  echo.
  set makenewprojectxslt=on
)
if defined makenewprojectxslt call :encoding "%projectpath%\setup\project.tasks" validate utf-8
if defined makenewprojectxslt call :xslt vimod-projecttasks2variable "projectpath='%projectpath%'" blank.xml "%cd%\scripts\xslt\project.xslt"
set lastprojectpath=%projectpath%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


