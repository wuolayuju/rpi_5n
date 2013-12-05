/******************************************************************************
* FILE: ser_mm.c
* DESCRIPTION:  
*   Serial Matrix Multiply - C Version
* AUTHOR: Blaise Barney
* LAST REVISED: 04/12/05
******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define N 1000

int timeval_subtract(struct timeval *result, struct timeval *t2, struct timeval *t1)
{
    long int diff = (t2->tv_usec + 1000000 * t2->tv_sec) - (t1->tv_usec + 1000000 * t1->tv_sec);
    result->tv_sec = diff / 1000000;
    result->tv_usec = diff % 1000000;

    return (diff<0);
}

int main(int argc, char *argv[])
{
int    i, j, k;			/* misc */
double a[N][N], 		/* matrix A to be multiplied */
       b[N][N],      	/* matrix B to be multiplied */
       c[N][N];		/* result matrix C */
  struct timeval t_begin, t_end, t_diff, t_total;

//printf("Starting serial matrix multiple example...\n");
//printf("Using matrix sizes a[%d][%d], b[%d][%d], c[%d][%d]\n",
        //N,N,N,N,N,N);

/* Initialize A, B, and C matrices */
//printf("Initializing matrices...\n");
for (i=0; i<N; i++)
   for (j=0; j<N; j++)
      a[i][j]= i+j;
for (i=0; i<N; i++)
   for (j=0; j<N; j++)
      b[i][j]= i*j;
for(i=0;i<N;i++)
   for(j=0;j<N;j++)
      c[i][j] = 0.0;

/* Perform matrix multiply */
//printf("Performing matrix multiply...\n");
gettimeofday(&t_begin, NULL);
for(i=0;i<N;i++)
   for(j=0;j<N;j++)
      for(k=0;k<N;k++)
         c[i][j]+= a[i][k] * b[k][j];

gettimeofday(&t_end, NULL); 
timeval_subtract(&t_diff, &t_end, &t_begin);
printf("%d %ld.%06ld\n",N,t_diff.tv_sec, t_diff.tv_usec);
/*printf("Here is the result matrix:");
for (i=0; i<N; i++) { 
   printf("\n"); 
   for (j=0; j<N; j++) 
      printf("%6.2f   ", c[i][j]);
   }
printf ("\nDone.\n");*/
}
