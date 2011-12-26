all:
	echo do something else

data: data.o ts04c.o
	f90 $< -o $@

%.o: %.for
	f90 $< -c -o $@

%.o: %.f90
	f90 $< -c -o $@
