set terminal postscript eps enhanced font ',24'
set xrange[-pi:pi]
set style function steps
set output 'steps.eps'
p sin(x) title 'hogehoge', sin(x)*cos(x) notitle
set output 'steps40.eps'
set samples 40
rep
set output
reset
