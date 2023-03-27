set terminal postscript eps enhanced font ',24'
set output 'splot.eps'
splot sin(x/5)*cos(y/5)
set output 'view.eps'
set view 50,60
rep
set output 'contour.eps'
set contour
rep
reset
