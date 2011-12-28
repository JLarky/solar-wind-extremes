all: run

run: plot
	./plot && sha1sum *.dat > files.sha1

show:
	./gnu.plot && convert lines.ps lines.png && rm lines.ps

plot: plot.o ts04c.o geopack.o
	f90 plot.o ts04c.o geopack.o -o $@

%.o: %.f90
	f90 $< -c -o $@

%.o: ../inc/%.for
	f90 $< -c -o $@
