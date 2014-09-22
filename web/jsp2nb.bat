@if '%1' == '' goto :CopyAll
qchg REVMMDDYY "" %1
del *.rpt
del *.bak
copy %1 \Workspace\NetBeansProjects\epammsApp\web\ 
copy genjs\%1 \Workspace\NetBeansProjects\epammsApp\web\genjs\
quit
:CopyAll
copy *.jsp \Workspace\NetBeansProjects\epammsApp\web\ 
copy genjs\*.js \Workspace\NetBeansProjects\epammsApp\web\genjs\