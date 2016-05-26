@if '%1' == '' goto :noway
copy %1 "%TOMCAT_HOME%\webapps\ROOT\epamms\%1"
quit
:noway
rem only one JSP copy at a time using this bat file