

:date
if /%dateformat%/ == /yyyy-mm-dd/ (
  set year=%date:~0,4%
  set month=%date:~5,2%
  set daydate=%date:~8,2%
  set curdate=%date%
) else if /%dateformat%/ == /mm-dd-yyyy/ (
  set year=%date:~6,4%
  set month=%date:~0,2%
  set daydate=%date:~3,2%
  set curdate=%year%-%month%-%daydate%
) else (
  set year=%date:~6,4%
  set month=%date:~3,2%
  set daydate=%date:~0,2%
  set curdate=%year%-%month%-%daydate%
)goto :eof


