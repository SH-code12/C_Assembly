#include<stdio.h>


double avarage(){

    printf("Shahd Elnassag^_^\n");
    /* use it when want take numbers from user
    int Array [10];
    double sum = 0.0; */

    // use it when Array is static 
    int Array_1 [10] = {1,2,3,4,5,6,7,8,9,10};
    double sum_1 = 0.0;

    int Array_2 [10] = {7,2,5,11,4,6,1,1,8,3};
    double sum_2 = 0.0;


    for (size_t i = 0; i < 10; i++)
    {
        /* use it when want take numbers from user
        printf("Enter number %d of array: " , i + 1);
        scanf("%d" ,&Array[i]);
        use it when Array is static
        sum += Array[i]; */
        sum_1 += Array_1[i];
        sum_2 += Array_2[i];
    }
    /* double average = sum / 10;
    printf("Average is: %.1f\n" , average); */
    printf("Test Case 1 \n");
    double average_1 = sum_1 / 10;
    printf("Average is: %.1f\n" , average_1);

    printf("Test Case 2 \n");
    double average_2 = sum_2 / 10;
    printf("Average is: %.1f\n" , average_2);

}

void main(){

    avarage();
}

