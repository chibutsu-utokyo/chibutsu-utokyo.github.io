set terminal png
set output "sin_pipi.png"
set xrange [-pi:pi]
set yrange [-2:2]
plot sin(x)