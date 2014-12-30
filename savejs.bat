@echo off
if "%1" == "" goto :err
checkit web\js\labeldesigner%1.js /f /e1
if errorlevel 1 goto :file-exists
goto :copy
:file-exists
qask "Copy web\js\labeldesigner.js over web\js\labeldesigner%1.js (y,n)?" yn
if errorlevel 2 goto :exit
:copy
echo copy web\wSPLDSPLD_UpdateLLD.jsp to web\wSPLDSPLD_UpdateLLD%1.jsp
copy web\wSPLDSPLD_UpdateLLD.jsp web\wSPLDSPLD_UpdateLLD%1.jsp
echo copy web\js\labeldesigner.js to web\js\labeldesigner%1.js
copy web\js\labeldesigner.js web\js\labeldesigner%1.js
goto :exit
:err
echo version required
:exit