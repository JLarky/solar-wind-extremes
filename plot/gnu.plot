#!/usr/bin/gnuplot

set terminal png interlace large font Arian 20 size 1600,1300
set output "lines.png"

#set size 1.1,0.6
plot [15:-20][-15:15] './linesg.dat' u 1:3 w l t ''
