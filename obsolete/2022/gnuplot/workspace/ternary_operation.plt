set terminal postscript eps enhanced font ',24'
set yrange [-0.2:1.2]
set output 'ternary_operation.eps'
p (x<0) ? 0 : 1
set output
reset
