all: run

run: extreme
	./extreme && sha1sum *.dat > files.sha1

%: %.f90
	f90 $< -o $@
