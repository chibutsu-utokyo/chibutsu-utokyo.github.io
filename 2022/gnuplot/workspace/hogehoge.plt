set terminal postscript eps enhanced font ',24'
set xrange[-pi:pi]
set output 'hogehoge.eps'
p sin(x) title 'hogehoge'
set output 'hogehoge2.eps'
p sin(x) title 'hogehoge', sin(x)*cos(x) notitle
set output
reset
