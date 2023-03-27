set parametric
set isosamples 50,10
set hidden
unset key
set ticslevel 0
set isosamples 50,20

set isosamples 100,20
set urange [0:9*pi]
set vrange [0:2*pi]
set autoscale z
splot (1-0.1*cos(v))*cos(u),(1-0.1*cos(v))*sin(u),0.1*(sin(v)+u/1.7-10)
