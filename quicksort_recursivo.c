#include <stdio.h>
#include <stdlib.h>

int* ordena(int* vetor, int esq, int dir);

int* quicksort(int* vetor, int tam){
    int esq = 0;
    int dir = tam-1;
    return ordena(vetor, esq, dir);
}

int* ordena(int* vetor, int esq, int dir){
    int pivo, aux;
    int i = esq;
    int j = dir;
    pivo = vetor[(esq + dir) / 2];

    while(i <= j){
        while(vetor[i] < pivo && i < dir){
            i++;
        }
        while(vetor[j] > pivo && j > esq){
            j--;
        }
        if(i <= j){
            aux = vetor[i];
            vetor[i] = vetor[j];
            vetor[j] = aux;
            i++;
            j--;
        }
    }
    if(j > esq){
        ordena(vetor, esq, j);
    }
    if(i < dir){
        ordena(vetor, i, dir);
    }
    return vetor;
}

void printvetor( int vetor[], int n )
{
    int i;
    for ( i = 0; i < n; ++i )
        printf( "%d ", vetor[i] );
}
 
int main()
{
    int vetor[] = {63, 9, 85, 66, 71, 8, 38, 42, 35, 89, 13, 20, 100, 75, 35, 68, 16, 91, 76, 56};
    int n = sizeof( vetor ) / sizeof( *vetor );
    quicksort( vetor, n);
    printvetor( vetor, n );
    return 0;
}