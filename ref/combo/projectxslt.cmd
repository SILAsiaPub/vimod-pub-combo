

:projectxslt
:: Description: make project.xslt from project.tasks
:: Required preset variables: 1
:: projectpath
:: Required functions:
:: getdatetime
:: xslt
call :getfiledatetime tasksdate "%projectsetuppath%\project.tasks"
call :getfiledatetime xsltdate "%pubxsltpath%\project.xslt"
rem firstly check if this is the last project run
if "%lastprojectpath%" == "%projectpath%" (
  rem then check if the project.tasks is newer than the project.xslt
  set /A tasksdate-=%xsltdate%
  if %tasksdate% GTR %xsltdate% (
    rem if the project.tasks is newer then remake the project.xslt
    echo  project.tasks newer: remaking project.xslt %tasksdate% ^> %xsltdate%
    echo.
    call :xslt vimod-projecttasks2variable "projectpath='%projectpath%'" %blankxml% "%cd%\scripts\xslt\project.xslt"
    set lastprojectpath=%projectpath%
    goto :eof
  ) else (
    call :inccount
    rem nothing has changed so don't remake project.xslt
    echo 1 project.xslt is newer. %xsltdate% ^> %tasksdate% project.tasks
    rem echo     Project.tasks  ^< %xsltdate% project.xslt.
    echo.
  )
) else (
  rem the project is not the same as the last one or Vimod has just been started. So remake project.xslt
  if defined lastprojectpath echo Project changed from "%lastprojectpath:~37%" to "%projectpath:~37%"
  if not defined lastprojectpath echo New session for project: %projectpath:~37%
  echo.
  echo Remaking project.xslt
  echo.
  call :xslt vimod-projecttasks2variable "projectpath='%projectpath%'" "%blankxml%" "%pubxsltpath%\project.xslt"
)
set lastprojectpath=%projectpath%goto :eof


