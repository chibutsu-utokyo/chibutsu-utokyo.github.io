set y2tics
set xlabel 'year'
set ylabel 'The sum of bananas which are imported(1000ton)'
set y2label 'The ratio'
set title 'Bananas which are imported'
plot 'kadai3.dat' using 1:2 with boxes axes x1y1  title 'sum'
replot 'kadai3.dat' using 1:(100*$3/$2) w l axes x1y2 title 'Taiwan'
replot 'kadai3.dat' using 1:(100*$4/$2) w l axes x1y2 title 'Ecuador'
replot 'kadai3.dat' using 1:(100*$5/$2) w l axes x1y2 title 'Philippines'
set terminal postscript eps color
set output 'kadai3.eps'
replot
set output
set terminal aqua
