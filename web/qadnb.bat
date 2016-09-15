@echo off
call qadcmpr "\Workspace\NetBeansProjects\epammsApp\web" "%TOMCAT_HOME%\webapps\ROOT\epamms" /x@qadnb.exc
type ad.rpt