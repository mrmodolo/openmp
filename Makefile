all:MP
	gcc exemplo01.o -o exemplo01 -lm

MP:
	gcc -c exemplo01.c
