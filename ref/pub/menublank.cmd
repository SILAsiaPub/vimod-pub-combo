

:menublank
:: Description: used to create a blank line in a menu and if supplied a sub menu title
:: Optional parameters:
:: blanktitle
if defined debugmenufunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
  echo.
  if defined blanktitle echo           %blanktitle%
  if defined blanktitle echo.
if defined debugmenufunc echo %endfuncstring% %0 %debugstack%goto :eof


