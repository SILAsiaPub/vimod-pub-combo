

:debugpause
:: Description: Sets the debug pause to on
:: Class: command - debug
:: Optional Parameters:
:: changedebugpause
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
echo on
set changedebugpause=%~1
if defined debugpause (
  echo debugging pause
  pause
) else (
  if "%changedebugpause%" == "off" (
    set debugpause=
  ) else if defined changedebugpause (
    set debugpause=on
  )
)
echo off
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%goto :eof


