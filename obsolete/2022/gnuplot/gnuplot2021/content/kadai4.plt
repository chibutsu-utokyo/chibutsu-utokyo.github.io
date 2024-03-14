set xlabel 'Height(m)'
set ylabel 'log p'
set title 'Scale Height'
f(x)=a*x+b
plot 'kadai4.dat' using 1:3 with line title 'Before fitting'
fit f(x) 'kadai4.dat' using 1:3 via a,b
replot f(x) title 'After fitting'
set terminal postscript eps color
set output 'kadai4.eps'
replot
set output