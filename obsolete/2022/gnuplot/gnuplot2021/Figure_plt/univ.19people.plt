set terminal postscript eps enhanced font ',24'
set output 'univ.19people1.eps'
p 'univ.19people.dat' using 1:(100*$3/$2) w l
set xlabel 'year'
set ylabel 'new students / 18-year-old (%)'
set title 'New University Students in Japan'
set output 'univ.19people2.eps'
p 'univ.19people.dat' using 1:(100*$3/$2) w l notitle
set output 'univ.19people3.eps'
set xrange [1950:2020]
set xtics('S25' 1950, ' ' 1955, 'S35' 1960, ' ' 1965, 'S45' 1970, ' ' 1975, 'S55' 1980, ' ' 1985, 'H02' 1990, ' ' 1995, 'H12' 2000, ' ' 2005, 'H22' 2010, ' ' 2015, 'R2' 2020)
p 'univ.19people.dat' using 1:(100*$3/$2) w l notitle
set output
reset