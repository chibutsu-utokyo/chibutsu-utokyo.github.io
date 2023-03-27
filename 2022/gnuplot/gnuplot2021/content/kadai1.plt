set size square
set xrange [-1:1]
set yrange[-1:1]
set xlabel 'x'
set ylabel 'y'
set title 'Parametric'
set parametric
plot cos(t),sin(t)
replot t,0
replot 0,t
set terminal postscript eps color
set output 'kadai1.eps'
replot
set output
