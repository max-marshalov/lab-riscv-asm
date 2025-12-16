#include <stdio.h>

#define N 4
#define M 4

void process(int n, int m, int matrix[M][N], float *result)
{
    int sum = 0;
    int min_size = (n < m) ? n : m;
    
   
    for (int i = 0; i < min_size; ++i) {
        sum += matrix[i][i];
    }
    
    
    *result = (float)sum;
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    float result;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &result);

    printf("%.2f\n", result);

    return 0;
}