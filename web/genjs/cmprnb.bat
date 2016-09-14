@echo off
if '%1' == '' goto :comparedir
"C:\Program Files (x86)\CompareIt!\wincmp3"  %1  "%TOMCAT_HOME%\webapps\ROOT\epamms\genjs\%1"
quit
:comparedir
"C:\Program Files (x86)\CompareIt!\SynchronizeIt!\wndsync" "\Workspace\NetBeansProjects\epammsApp\web\genjs" "%TOMCAT_HOME%\webapps\ROOT\epamms\genjs" 