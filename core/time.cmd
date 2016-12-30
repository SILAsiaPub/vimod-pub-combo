:time
:: Description: Retrieve time in several shorter formats than %time% provides
:: Created: 2016-05-05
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
FOR /F "tokens=1-4 delims=:%timeseparator%." %%A IN ("%time%") DO (
  set curhhmm=%%A%%B
  set curhhmmss=%%A%%B%%C
  set curhh_mm=%%A:%%B
  set curhh_mm_ss=%%A:%%B:%%C
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof


