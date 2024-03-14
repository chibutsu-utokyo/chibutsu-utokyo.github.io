set terminal postscript eps enhanced font ',24'
set output 'multi.eps'
set multiplot
set size 1,0.5
set origin 0,0.5
set xrange [-pi:pi]
p sin(x)
set origin 0,0
p cos(x)
unset multiplot
set output
reset
