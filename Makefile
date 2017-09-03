.PHONY: clean

all: clean exemplo01 exemplo01-clang hello

exemplo01: exemplo01.c
	gcc -Wall exemplo01.c -fopenmp -lm -o exemplo01	

exemplo01-clang: exemplo01.c
	clang exemplo01.c  -Weverything -fopenmp -lm -o exemplo01-clang

hello: hello.c
	clang hello.c  -Weverything -fopenmp -o hello

clean:
	rm -f exemplo01 exemplo01-clang hello
	@echo Arquivos removidos
