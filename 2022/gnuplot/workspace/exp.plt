set terminal postscript eps enhanced font ',24'
set xrange [-pi:pi]
set grid
set output 'exp.eps'
set logscale y
p exp(x+1)
set output
reset
