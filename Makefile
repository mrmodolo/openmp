exemplo01: exemplo01.c
	gcc -Wall exemplo01.c -fopenmp -lm -o exemplo01	

exemplo01-clang: exemplo01.c
	clang exemplo01.c -fopenmp -lm -o exemplo01-clang
