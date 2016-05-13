@echo off
if '%1' == '' goto :comparedir
"C:\Program Files (x86)\CompareIt!\wincmp3"  %1  "\Program Files\Apache Group\Tomcat 7.0\webapps\ROOT\epamms\%1"
quit
:comparedir
"C:\Program Files (x86)\CompareIt!\SynchronizeIt!\wndsync" "\Workspace\NetBeansProjects\epammsApp\web" "\Program Files\Apache Group\Tomcat 7.0\webapps\ROOT\epamms" 