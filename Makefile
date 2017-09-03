.PHONY: clean

all: clean exemplo01 exemplo01-clang exemplo02-clang hello

exemplo01: exemplo01.c
	gcc -Wall exemplo01.c -fopenmp -lm -o exemplo01	

exemplo01-clang: exemplo01.c
	clang exemplo01.c  -Weverything -fopenmp -lm -o exemplo01-clang

exemplo02-clang: exemplo02.c
	clang exemplo02.c  -Weverything -fopenmp -lm -o exemplo02-clang

hello: hello.c
	clang hello.c  -Weverything -fopenmp -o hello

clean:
	rm -f exemplo01 exemplo01-clang hello exemplo02-clang
	@echo Arquivos removidos
