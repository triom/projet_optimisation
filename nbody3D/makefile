CC=gcc
IC=icc
CX=icx

CFLAGS=-march=native -g3

OFLAGS=-O1 -fopenmp -fopt-info-all=nbody.gcc.optrpt 

all: nbody3D nbody3DIC nbody3DCX

nbody3D: nbody.c
	$(CC) $(CFLAGS) $(OFLAGS) $< -o $@ -lm -fopenmp

nbody3DIC: nbody.c
	$(IC) -xhost -Ofast -qopt-report $< -o $@ -qmkl -qopenmp

nbody3DCX: nbody.c
	$(CX)  -xhost -Ofast -fsave-optimization-record $< -o $@ -qmkl -qopenmp 

clean:
	rm -Rf *~ nbody3D nbody3DIC nbody3DCX *.optrpt



