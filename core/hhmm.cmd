

:hhmm
set hh=%time:~0,2%
set hh=%hh: =0%
set mm=%time:~3,2%
set mm=%mm: =0%
set hhmm=%hh%%mm%goto :eof


