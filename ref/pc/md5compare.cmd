

:md5compare
:: no current use
:: Description: Compares the MD5 of the current project.tasks with the previous one, if different then the project.xslt is remade
:: Purpose: to see if the project.xslt needs remaking
:: Required preset variables: 1
:: cd
:: projectpath
:: Required parameters: 0
:: Required functions:
:: md5create
:: getline
set md5check=diff
if exist "%cd%\logs\project-tasks-cur-md5.txt" del "%cd%\logs\project-tasks-cur-md5.txt"
call :md5create "%projectpath%\setup\project.tasks" "%cd%\logs\project-tasks-cur-md5.txt"
if exist  "%cd%\logs\project-tasks-last-md5.txt" (
  call :getline 4 "%cd%\logs\project-tasks-last-md5.txt"
  set lastmd5=%getline%
  call :getline 4 "%cd%\logs\project-tasks-cur-md5.txt"
  rem clear getline var
  set getline=
  if "%lastmd5%" == "%getline%" (
    set md5check=same
  )
)
del "%cd%\logs\project-tasks-last-md5.txt"
ren "%cd%\logs\project-tasks-cur-md5.txt" "project-tasks-last-md5.txt"goto :eof


