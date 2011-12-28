#!/usr/bin/gnuplot

set term postscript enhanced color portrait
set output "lines.ps"

set size 1.588,.834
set xlabel 'X_{GSM}, Re'
set ylabel 'Z_{GSM}, Re'

z_max = system("head -n 1 ./points.dat | awk '{print $3}'")
z_f = system("head -n 3 ./points.dat | tail -n 1 | awk '{print $3}'")
set arrow 3 from -5,10 to -0.1,z_max-0.1
set label sprintf("Z_{max} = %.2f Re", z_max+0.) at -5.1,9.9
set label sprintf("{/Symbol q}_{Z_{max}} = %.2f {/Symbol \260}", asin(z_f+0.)*180./3.14159) at -5.1,8.9

r_0 = system("head -n 4 ./points.dat | tail -n 1 | awk '{print $1}'") # sun point
z_f = system("head -n 5 ./points.dat | tail -n 1 | awk '{print $3}'") # sun point
set arrow 4 from 10,-5 to r_0+0.1,-0.1
set label sprintf("R_{0} = %.2f Re", r_0+0.) at 10,-6
set label sprintf("{/Symbol q}_{R_0} = %.2f {/Symbol \260}", asin(z_f+0.)*180./3.14159) at 10,-7

x_closed = system("head -n 7 ./points.dat | tail -n 1 | awk '{print $1}'") # closed lines
z_f = system("head -n 6 ./points.dat | tail -n 1 | awk '{print $3}'") # closed lines
set arrow 5 from -5,-5 to x_closed+0.1,-0.1
set label sprintf("X_{LAST CLOSED LINE} = %.2f Re", x_closed+0.) at -5,-6

z_f = system("head -n 8 ./points.dat | tail -n 1 | awk '{print $3}'") # night side
set arrow 6 from 0-1,-7 to -6.511,-0.1
set label sprintf("{/Symbol q}_{geostational} = %.2f {/Symbol \260}", asin(z_f+0.)*180./3.14159) at 3-1,-8.0

z_f = system("head -n 10 ./points.dat | tail -n 1 | awk '{print $3}'") # day side
set arrow 7 from 0+4,-9 to 6.511,-0.1
set label sprintf("{/Symbol q}_{geostational} = %.2f {/Symbol \260}", asin(z_f+0.)*180./3.14159) at 3+4,-10.0


plot [15:-25][-15:15] './linesg.dat' u 1:3 w l t '', './points.dat' u 1:3 w p t ''
