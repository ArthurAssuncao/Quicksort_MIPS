#include <stdio.h>
#include <stdlib.h>
// Fonte: http://www.geeksforgeeks.org/iterative-quick-sort/
void swap ( int* a, int* b ){
    int t = *a;
    *a = *b;
    *b = t;
}
 
int particionar(int vetor[], int esq, int dir){
    int x = vetor[dir];
    int i = (esq - 1);
    int j;
    for (j = esq; j < dir; j++){
        if (vetor[j] <= x){
            i++;
            swap (&vetor[i], &vetor[j]);
        }
    }
    swap (&vetor[i + 1], &vetor[dir]);
    return (i + 1);
}

void quicksort_iterativo(int vetor[], int esq, int dir){
    int stack[ dir - esq + 1 ];
 
    int top = -1;
 
    stack[ ++top ] = esq;
    stack[ ++top ] = dir;
 
    while ( top >= 0 ){
        dir = stack[ top-- ];
        esq = stack[ top-- ];
 
        int p = particionar( vetor, esq, dir );
 
        if ( p-1 > esq ){
            stack[ ++top ] = esq;
            stack[ ++top ] = p - 1;
        }
 
        if ( p+1 < dir ){
            stack[ ++top ] = p + 1;
            stack[ ++top ] = dir;
        }
    }
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
    quicksort_iterativo( vetor, 0, n - 1 );
    printvetor( vetor, n );
    return 0;
}