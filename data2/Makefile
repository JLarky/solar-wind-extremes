all: run

run: data
	./data && sha1sum *.dat > files.sha1

data: data.f90
	f90 $< -o $@
