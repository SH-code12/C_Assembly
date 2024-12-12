#include <stdio.h>

int count(int arr[],int size){
int count=0;
    for( int i=0;i<size;++i){
        if(arr[i]%2==0)count++;
    }
    return count;
}


int main() {
    int arr1[] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int arr2[] = {19, 2, 3, 7, 5, 10, 9, 0, 6, 1};
    int size = sizeof(arr1) / sizeof(arr1[0]);


    int count1 = count(arr1,size);
    int count2 = count(arr2,size);
 
    printf("Count of even numbers for test1 is: %d\n", count1);


    printf("Count of even numbers for test2 is: %d\n", count2);

    return 0;
}
