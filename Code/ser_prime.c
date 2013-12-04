/******************************************************************************
* FILE: ser_prime.c
* DESCRIPTION: 
*   This program generates primes. The approach taken is a "brute force"
*   method which requires increasingly greater amounts of cpu as the problem
*   size increases.  It should lend itself well to an embarassingly parallel
*   solution since each prime can be computed independently of all other
*   primes.
* AUTHOR: Blaise Barney 11/25/95 - adapted from version contributed by 
*   Richard Ng & Wong Sze Cheong during MHPCC Singapore Workshop (8/22/95).
* LAST REVISED: 04/12/05
****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define LIMIT     2500000     /* Increase this to find more primes */
#define PRINT     100000      /* Print a line after this many numbers */

int timeval_subtract(struct timeval *result, struct timeval *t2, struct timeval *t1)
{
    long int diff = (t2->tv_usec + 1000000 * t2->tv_sec) - (t1->tv_usec + 1000000 * t1->tv_sec);
    result->tv_sec = diff / 1000000;
    result->tv_usec = diff % 1000000;

    return (diff<0);
}

int isprime(int n) {
int i,squareroot;
if (n>10) {
   squareroot = (int) sqrt(n);
   for (i=3; i<=squareroot; i=i+2)
      if ((n%i)==0)
         return 0;
   return 1;
   }
/* Assume first four primes are counted elsewhere. Forget everything else */
else
   return 0;
}


int main(int argc, char *argv[])
{
int n,                           /* loop variables */
    pc,                          /* prime counter */
    foundone;                    /* most recent prime found */
  struct timeval t_begin, t_end, t_diff, t_total;
printf("Starting. Numbers to be scanned= %d\n",LIMIT);
gettimeofday(&t_begin, NULL);
pc=4;     /* Assume the primes less than 10 (2,3,5,7) are counted here */

for (n=11; n<=LIMIT; n=n+2) {
   if (isprime(n)) {
      pc++;
      foundone = n;
      /***** Optional: print each prime as it is found 
      printf("%d\n",foundone);
      *****/
      }			
   //if ( (n-1)%PRINT == 0 ) 
    //  printf("Numbers scanned= %d   Primes found= %d\n",n-1,pc);
   }
gettimeofday(&t_end, NULL);  
timeval_subtract(&t_diff, &t_end, &t_begin);
printf("Done. Largest prime is %d Total primes %d\n",foundone,pc);
printf("Wallclock time elapsed: %ld.%06ld seconds\n",t_diff.tv_sec, t_diff.tv_usec);
} 
