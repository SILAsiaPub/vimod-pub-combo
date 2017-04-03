@echo off
:: Title: pub.cmd
:: Title Description: Vimod-Pub batch file with menus and tasklist processing
:: Author: Ian McQuay
:: Created: 2012-03
:: Last Modified: 2016-010-12
:: Source: https://github.com/silasiapub/vimod-pub
:: Commandline startup options:
:: pub  - normal usage for menu starting at the data root.
:: pub tasklist tasklistname.tasks -  process a particular tasklist, no menus used. Used with Electron Vimod-Pub GUI
:: pub menu menupath - Start projet.menu at a particular path
:: pub debug function_name - Just run a particular function to debug
goto :main


