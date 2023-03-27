set pm3d map
set xrange [-3:3]
set yrange [-3:3]
set xlabel 'x'
set ylabel 'y'
set title '3D plot'
splot x**2*exp(-x**2)*y**2*exp(-y**2)
set isosample 40
replot
set terminal postscript eps color
set output 'kadai2.eps'
replot
set output