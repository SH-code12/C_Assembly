#include<stdio.h>


float avarage(){

    printf("Shahd Elnassag ^_^\n");
    // use it when want take numbers from user
    int Array [10];
    int counter = 0;
    int sum = 0; 
    while (counter < 10)
    {
        // use it when want take numbers from user
        printf("Enter number %d of array: " , counter + 1);
        scanf("%d" ,&Array[counter]);
        // use it when Array is static
        sum += Array[counter];
        counter++;
    }
    float average = (float) sum / 10;
    printf("Average is: %.1f\n" , average); 
}

void main(){

    avarage();
}

