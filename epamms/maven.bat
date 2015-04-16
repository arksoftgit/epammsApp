@echo off
set path=%path%;C:\Program Files\Apache Group\apache-maven-3.2.3\bin
cd javaproject
call mvn install -DskipTests=true
cd ..