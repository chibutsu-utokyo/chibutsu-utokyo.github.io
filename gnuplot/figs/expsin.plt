reset
set terminal png

set output "expsin.png"
set xlabel 'x'
set ylabel 'y'
set title 'Another cool graph'
set xrange [0:10]
set yrange [-1:1]
p exp(-x) * sin(10*x)

set terminal qt
reset