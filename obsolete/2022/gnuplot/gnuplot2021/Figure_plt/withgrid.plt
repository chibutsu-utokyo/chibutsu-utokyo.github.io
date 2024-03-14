set terminal postscript eps enhanced font ',24'
set xrange[-pi:pi]
set output 'with.eps'
p sin(x) with points, sin(x)*cos(x) with impulses
set output 'grid.eps'
set grid
rep
set output
reset
