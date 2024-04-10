reset
set terminal png
set output "Heaviside.png"

set yrange [-0.2:1.2]
plot (x < 0) ? 0 : 1

set terminal qt
reset