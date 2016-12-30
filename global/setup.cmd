:setup
:: Description: sets variables for the batch file
:: Required rerequisite variables
:: projectpath
:: htmlpath
:: localvar
:: Func calls: 1
:: checkdir
if defined masterdebug call :funcdebugstart setup
set basepath=%cd%
call :var-%pubtype%
set projectlogspath=%projectpath%\logs
rem java classpath additions and catalog resolver to handle xhtml11
set extendclasspath=%pubpath%\tools\saxon\saxon9he.jar;%pubpath%\tools\java\resolver.jar;%pubpath%\tools\java
set loadcat=-Dxml.catalog.files
set nodrive=%pubpath:~2%
set cat=%pubpath%\tools\java\cat\catalog.xml
set usecatalog1=-r:org.apache.xml.resolver.tools.CatalogResolver 
set usecatalog2=-x:org.apache.xml.resolver.tools.ResolvingXMLReader
set altjre=%pubpath%\tools\jre7\bin\java.exe
rem check if logs directory exist and create if not there  
rem DO NOT change following to checkdir
if not exist "%projectlogspath%" md "%projectlogspath%" 
call :datetime
set projectlog=%projectlogspath%\%curdate%-build.log
rem echo on
rem set the predefined variables
rem Weird! If I don't set up a new variable the following input variables in the Solo context loose their path.
rem In the Classic Pub ther is no problem. I have no understanding of what is going on.
set bypassufs=%userfeedbacksettings%
set bypassfds=%functiondebugsettings%
if exist "%bypassufs%" if not defined skipsettings call :variableslist "%bypassufs%"
if exist "%bypassfds%" if not defined skipsettings call :variableslist "%bypassfds%"
call :variableslist "%vimodvar%"
rem test if essentials exist depreciated now just put in user installed tools
if exist "%essentialtools%" call :variableslist "%essentialtools%" fatal
rem added to aid new users in setting up
if exist "%userinstalledtools%" call :variableslist "%userinstalledtools%"
if not defined java call :testjava
set classpath=%classpath%;%extendclasspath%
if not defined saxon9 set saxon9=%pubtoolspath%\saxon\saxon9he.jar
if defined masterdebug call :funcdebugend
goto :eof


