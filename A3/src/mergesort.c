#include<stdio.h>
#include "x86prime_lib.h"

void merge_sort(long a[],long i,long j);
void merge(long a[],long i1,long j1,long i2,long j2);

long main()
{
    long a[30],n,i;
    printf("Enter no of elements:");
    scanf("%ld",&n);
    printf("Enter array elements:");

    for(i=0;i<n;i++)
        scanf("%ld",&a[i]);

    merge_sort(a,0,n-1);

    printf("\nSorted array is :");
    for(i=0;i<n;i++)
        printf("%ld ",a[i]);

    return 0;
}

void merge_sort(long a[],long i,long j)
{
    long mid;

    if(i<j)
    {
        mid=(i+j)>>1;
        merge_sort(a,i,mid);         //left recursion
        merge_sort(a,mid+1,j);       //right recursion
        merge(a,i,mid,mid+1,j);     //merging of two sorted sub-arrays
    }
}

void merge(long a[],long i1,long j1,long i2,long j2)
{
    long temp[50];    //array used for merging
    long i,j,k;
    i=i1;    //beginning of the first list
    j=i2;    //beginning of the second list
    k=0;

    while(i<=j1 && j<=j2)    //while elements in both lists
    {
        if(a[i]<a[j])
            temp[k++]=a[i++];
        else
            temp[k++]=a[j++];
    }

    while(i<=j1)    //copy remaining elements of the first list
        temp[k++]=a[i++];

    while(j<=j2)    //copy remaining elements of the second list
        temp[k++]=a[j++];

    //Transfer elements from temp[] back to a[]
    for(i=i1,j=0;i<=j2;i++,j++)
        a[i]=temp[j];
}
/*
long* run() {
  init_allocator();
  // Read it the program should print
  // 0: Silent mode
  // 1: Print sorted list
  // 2: Get input from stdin
  // 3: Test mode (print + input)
  long mode = read_long();
  long is_printing = mode & 1;
  long get_input = mode & 2;
  // Read number of elements in array
  long num_entries = read_long();
  long* p = get_random_array(num_entries);
  // Run the algorithm
  if (get_input) {
    p = read_array(num_entries);
  }
  else {
    p = get_random_array(num_entries);
  }

  merge_sort(p, 0, num_entries);

  if (is_printing) {
    print_array(num_entries, p);
  }
  return p; // <-- prevent optimization
}
*/
