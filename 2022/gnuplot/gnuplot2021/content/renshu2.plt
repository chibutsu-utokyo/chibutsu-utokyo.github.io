set xrange [-3:3]
set yrange [-3:3]
splot x**2*exp(-x**2)*y**2*exp(-y**2)
set isosample 40
set pm3d map
replot
set terminal postscript eps color
set output 'renshu2.eps'
replot
set output