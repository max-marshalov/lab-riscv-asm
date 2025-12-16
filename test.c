#include <stdio.h>

#define N 4
#define M 4

extern void process(int n, int m, int matrix[M][N], int *result);

int main()
{
    int matrix[M][N];
    int avg;
    
    printf("Введите матрицу 4x4:\n");
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &avg);

    
    printf("Среднее арифметическое: %d\n", avg);

    return 0;
}