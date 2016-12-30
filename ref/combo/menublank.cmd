

:menublank
:: Description: used to create a blank line in a menu and if supplied a sub menu title
:: Optional parameters:
:: blanktitle
  echo.
  if defined blanktitle echo           %blanktitle%
  if defined blanktitle echo.goto :menu


