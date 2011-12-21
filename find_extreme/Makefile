all: run

run: extreme
	./extreme

%: %.f90
	f90 $< -o $@
