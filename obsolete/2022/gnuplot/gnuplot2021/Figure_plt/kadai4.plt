set terminal postscript eps enhanced font ',20'
set xlabel 'Height [m]'
set ylabel 'Pressure [hPa]'
set output 'kadai4-1.eps'
p 'kadai4.dat' w l
set output 'kadai4-2.eps'
set ylabel 'log P'
p 'kadai4.dat' using 1:3 w l
set output
set title 'Scale Height'
f(x)=a*x+b
set terminal aqua
plot 'kadai4.dat' using 1:3 with line title 'Observation'
fit f(x) 'kadai4.dat' using 1:3 via a,b
replot f(x) title 'Fitting function'
set terminal postscript eps enhanced color font ',20'
set output 'kadai4.eps'
rep
set output
reset
