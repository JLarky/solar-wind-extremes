#!/usr/bin/gnuplot

set term postscript enhanced color portrait
set output "lines.ps"
set size 2.5,1.3

#plot [10:-10][-10:10] './lines.dat' u 1:3 w p

set size 1.1,0.5
set size 1.1,0.6
plot [30:-30][-20:20] './linesg.dat' u 1:3 w l t ''
plot [10:-10][-7:7]   './linesg.dat' u 1:3 w l t ''
plot [15:-15][-10:10] './linesg.dat' u 1:3 w l t ''
