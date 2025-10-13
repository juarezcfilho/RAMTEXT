FC=gfortran
FF=-Og
FW=-Waliasing -Wampersand -Wconversion -Wsurprising

RAMTEXT.o: 
	$(FC) $(FF) $(FW) -c ../RAMTEXT.f90 -o RAMTEXT.o
	#ar -cr libRAMTEXT.a RAMTEXT.o
