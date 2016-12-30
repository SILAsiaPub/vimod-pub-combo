:datetime
:: Destription: Provide some preset date time formats
call :hhmm
call :date
set isodatetime=%curisodate%T%curhh_mm_ss%
set yyy-mm-ddThh_mm_ss=%curisodate%T%curhh_mm_ss%
set yymmddhhmm=%curyymmdd%%hhmm%
set yyyymmddhhmm=%curyyyymmdd%%hhmm%
goto :eof


