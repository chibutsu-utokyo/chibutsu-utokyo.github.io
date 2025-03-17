reset
set terminal png
set output "multiplot.png"

set multiplot
set size 1,0.5
set origin 0,0.5
plot sin(x)
set origin 0,0
plot cos(x)

unset multiplot
set terminal qt
reset