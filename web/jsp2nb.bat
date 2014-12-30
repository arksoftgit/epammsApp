@if '%1' == '' goto :CopyAll
qchg REVMMDDYY "" %1
del *.rpt
del *.bak
copy %1 \Workspace\NetBeansProjects\epammsApp\web\ 
set _js=%1
set _js2=%_js:.jsp=.js%
copy genjs\%_js2% \Workspace\NetBeansProjects\epammsApp\web\genjs\
quit
:CopyAll
copy *.jsp \Workspace\NetBeansProjects\epammsApp\web\ 
copy genjs\*.js \Workspace\NetBeansProjects\epammsApp\web\genjs\