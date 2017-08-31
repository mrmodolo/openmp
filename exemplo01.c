#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <limits.h>

#define ERRO_ENTRADA -1
#define ENTRADA_OK 0

int ehprimo(long int n) {
            int primo = 1;
            long int i;
            for (i=2;i<sqrt(n+1);i++)
            {
                        if ((n%i)==0)
                        {
                                    primo=0;
                                    break;
                        }
            }
            return primo;
}
 
int retorna_inf_sup(int argc, char ** argv, long int * inf, long int * sup) {

		if (argc < 3) {
				printf("Os parâmetros inferior e superior são obrigatórios!\n");
				printf("USO: %s <LIMITE INFERIOR> <LIMITE SUPERIOR>\n", argv[0]);
				return ERRO_ENTRADA;
		}

		*inf = atoi(argv[1]);
		*sup = atoi(argv[2]);
		if (*inf < 0 || LONG_MAX < *inf) {
				printf("O limite inferior deve ser maior que zero e menor que %12.5e!\n", LONG_MAX);
				return ERRO_ENTRADA;
		}
		if (*sup < 0 || LONG_MAX < *sup) {
				printf("O limite superior deve ser maior que zero e menor que %12.5e!\n", LONG_MAX);
				return ERRO_ENTRADA;
		}
		if (*sup <= *inf ) {
				printf("O limite superior deve ser maior que o inferior!\n");
				return ERRO_ENTRADA;
		}
		return ENTRADA_OK;
}	

int main(int argc, char ** argv) {
           
            long int i;
            long int cp=0;
            long int inf=0;
            long int sup=0;

			if ( retorna_inf_sup(argc, argv, &inf, &sup) != ENTRADA_OK ) {
				exit(EXIT_FAILURE);
			}

            for (i=inf; i<=sup; i++)
                        if (ehprimo(i))
                        {
                                    cp++;
                                    #ifdef DEBUG
                                    printf("%ld, ",i);
                                    #endif
                        }
            printf("\nCount=%ld\n",cp);
            return 0;
}
