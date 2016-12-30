


:setup
:: Description: sets variables for the batch file
:: Required rerequisite variables
:: projectpath
:: htmlpath
:: localvar
:: Func calls: 1
:: checkdir
rem echo on
set projectpath=%cd%
set pubpath=%cd%\pub
set setuppath=%cd%
set projectsetupfolder=%projectpath%
set basepath=%projectpath%
rem Global VimodPub key folders
set pubsetuppath=%pubpath%\setup
set pubtoolspath=%pubpath%\tools
set cctpath=%pubpath%\scripts\cct
set xsltpath=%pubpath%\scripts\xslt
set commontaskspath=%pubpath%\tasks
set commonmenufolder=%pubpath%\menus
rem java classpath additions and catalog resolver to handle xhtml11
set extendclasspath=%pubpath%\tools\saxon\saxon9he.jar;%pubpath%\tools\java\resolver.jar;%pubpath%\tools\java
set loadcat=-Dxml.catalog.files
set nodrive=%pubpath:~2%
set cat=%pubpath%\tools\java\cat\catalog.xml
set usecatalog1=-r:org.apache.xml.resolver.tools.CatalogResolver 
set usecatalog2=-x:org.apache.xml.resolver.tools.ResolvingXMLReader
set altjre=%gpbupath%\tools\jre7\bin\java.exe



rem echo pubsetuppath=%gpugsetuppath%

rem set project log file name by date
set curdate=%date:~-4,4%-%date:~-7,2%-%date:~-10,2%
set projectlog=%projectpath%\logs\%curdate%-build.log
echo off

rem check if logs directory exist and create if not there  DO NOT change to checkdir
call :checkdir logs

rem set the predefined variables
call :variableslist "%pubsetuppath%\vimod.var"

rem test if essentials exist
rem call :variableslist "%pubsetuppath%\essential_installed_tools.var" fatal

rem added to aid new users in setting up
if exist "%pubsetuppath%\user_installed_tools.var" call :variableslist "%pubsetuppath%\user_installed_tools.var"
if exist "%pubsetuppath%\user_feedback_settings.var" if not defined skipsettings call :variableslist "%pubsetuppath%\user_feedback_settings.var"
if exist "%pubsetuppath%\functiondebug_settings.var" if not defined skipsettings call :variableslist "%pubsetuppath%\functiondebug_settings.var"
if not defined java call :testjava
set classpath=%classpath%;%extendclasspath%goto :eof


