set terminal postscript eps enhanced font ',24'
set parametric
set output 'circle.eps'
p cos(t),sin(t)
set output 'sphere.eps'
splot sin(u)*cos(v),sin(u)*sin(v),cos(u)
set output
reset
