:encoding
:: Description: to check the encoding of a file
:: Created: 2016-05-17
:: Required parameters:
:: file
:: activity = validate or check
:: Optional parameters:
:: validateagainst
:: Depends on:
:: infile
:: nameext
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
if not defined encodingchecker echo Encoding not checked. &goto :eof
if not exist "%encodingchecker%" echo file.exe not found! %fileext% &echo Encoding not checked. & goto :eof
set testfile=%~1
set activity=%~2
set validateagainst=%~3
call :infile "%testfile%"
call :nameext "%infile%"
set command=%encodingchecker% -m %magic% --mime-encoding "%infile%"
FOR /F "tokens=1-2" %%A IN ('%command%') DO set fencoding=%%B

if "%activity%" == "validate" (
    if "%fencoding%" == "%validateagainst%"  (
        echo Encoding is %fencoding% for file %nameext%.
      ) else if "%fencoding%" == "us-ascii" (
        echo Encoding is %fencoding% not %validateagainst% but is usable.
      ) else (
      echo File %nameext% encoding is invalid! 
      echo Encoding found to be %fencoding%! But it was expected to be %validateagainst%.
      set errorsuspendprocessing=on
  )
) else  (              
    echo Encoding is: %fencoding% for file %nameext%.
) 
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


