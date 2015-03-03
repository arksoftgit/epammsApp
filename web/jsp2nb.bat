@if '%1' == '' goto :noway
copy %1 "\Program Files\Apache Group\Tomcat 7.0\webapps\ROOT\epamms\%1"
quit
:noway
rem only one JSP copy at a time using this bat file