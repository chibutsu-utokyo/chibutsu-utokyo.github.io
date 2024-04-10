reset
set terminal png
set output '3d.png'

set isosamples 50
splot exp(-(x**2+y**2)/10)

set terminal qt
reset