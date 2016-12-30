

:menuvaluechooserevaluation
:: Class: command - internal - menu
rem echo on
if defined varvalue goto :eof
set let=%~1
IF /I '%Choice%'=='a' set valuechosen=%valuea%& set varvalue=set& exit /b
IF /I '%Choice%'=='b' set valuechosen=%valueb%& set varvalue=set& exit /b
IF /I '%Choice%'=='c' set valuechosen=%valuec%& set varvalue=set& exit /b
IF /I '%Choice%'=='d' set valuechosen=%valued%& set varvalue=set& exit /b
IF /I '%Choice%'=='e' set valuechosen=%valuee%& set varvalue=set& exit /b
IF /I '%Choice%'=='f' set valuechosen=%valuef%& set varvalue=set& exit /b
IF /I '%Choice%'=='g' set valuechosen=%valueg%& set varvalue=set& exit /b
IF /I '%Choice%'=='h' set valuechosen=%valueh%& set varvalue=set& exit /b
IF /I '%Choice%'=='i' set valuechosen=%valuei%& set varvalue=set& exit /b
IF /I '%Choice%'=='j' set valuechosen=%valuej%& set varvalue=set& exit /b
IF /I '%Choice%'=='k' set valuechosen=%valuek%& set varvalue=set& exit /b
IF /I '%Choice%'=='l' set valuechosen=%valuel%& set varvalue=set& exit /b
IF /I '%Choice%'=='m' set valuechosen=%valuem%& set varvalue=set& exit /bgoto :eof


