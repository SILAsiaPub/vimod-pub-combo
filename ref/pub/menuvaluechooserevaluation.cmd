

:menuvaluechooserevaluation
:: Class: command - internal - menu
rem echo on
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
if defined varvalue goto :eof
set let=%~1
IF /I '%Choice%'=='a' set valuechosen=%valuea%& set varvalue=set& goto :eof
IF /I '%Choice%'=='b' set valuechosen=%valueb%& set varvalue=set& goto :eof
IF /I '%Choice%'=='c' set valuechosen=%valuec%& set varvalue=set& goto :eof
IF /I '%Choice%'=='d' set valuechosen=%valued%& set varvalue=set& goto :eof
IF /I '%Choice%'=='e' set valuechosen=%valuee%& set varvalue=set& goto :eof
IF /I '%Choice%'=='f' set valuechosen=%valuef%& set varvalue=set& goto :eof
IF /I '%Choice%'=='g' set valuechosen=%valueg%& set varvalue=set& goto :eof
IF /I '%Choice%'=='h' set valuechosen=%valueh%& set varvalue=set& goto :eof
IF /I '%Choice%'=='i' set valuechosen=%valuei%& set varvalue=set& goto :eof
IF /I '%Choice%'=='j' set valuechosen=%valuej%& set varvalue=set& goto :eof
IF /I '%Choice%'=='k' set valuechosen=%valuek%& set varvalue=set& goto :eof
IF /I '%Choice%'=='l' set valuechosen=%valuel%& set varvalue=set& goto :eof
IF /I '%Choice%'=='m' set valuechosen=%valuem%& set varvalue=set& goto :eof
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%goto :eof


