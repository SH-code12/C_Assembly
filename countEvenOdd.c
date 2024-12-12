#include <stdio.h>

int main() {
    int arr1[] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int arr2[] = {19, 2, 3, 7, 5, 10, 9, 0, 6, 1};
    int size = 10;


    int count = 0;
    for (int i = 0; i < size; i++) {
        if (arr1[i] % 2 == 0) {
            count++;
        }
    }
    printf("Count of even numbers for test1 is: %d\n", count);

    count = 0;
    for (int i = 0; i < size; i++) {
        if (arr2[i] % 2 == 0) {
            count++;
        }
    }
    printf("Count of even numbers for test2 is: %d\n", count);

    return 0;
}
