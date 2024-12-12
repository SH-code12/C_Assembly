#include <stdio.h>

int find_minimum(int array[], int size) {
    int min = array[0]; 
    for (int i = 1; i < size; i++) {
        if (array[i] < min) {
            min = array[i]; 
        }
    }
    return min; 
}

int main() {
    int array01[] = {15, 8, 23, 4, 16, 42, 7, 5, 3, 9};
    int array02[] = {25, 18, 2, 34, 6, 2, 1, 5, 31, 90};
    
    int size = 10; 

    // Find the minimum 
    int min01 = find_minimum(array01, size);

    // Print the result 
    printf("The minimum value in first array is: %d\n", min01);

    // Find the minimum value 
    int min02 = find_minimum(array02, size);

    // Print the result 
    printf("The minimum value in second array is: %d\n", min02);

    return 0;
}