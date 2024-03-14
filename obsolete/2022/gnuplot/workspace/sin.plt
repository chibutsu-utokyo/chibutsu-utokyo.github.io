set terminal postscript eps enhanced font ',24'
set output 'sin.eps'
p sin(x)
set output 'sincos.eps'
p sin(x),cos(x)
set output 'sincos2.eps'
rep cos(x*2)
set output 'sincos2pi.eps'
set xrange[-pi:pi]
rep
set output
reset
