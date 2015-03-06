@if '%1' == '' goto :noway
copy %1 "\Program Files\Apache Group\Tomcat 7.0\webapps\ROOT\epamms\genjs\%1"
quit
:noway
rem only one copy from genjs at a time using this bat file