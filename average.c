#include<stdio.h>


float avarage(){

    printf("Shahd Elnassag ^_^\n");
    int cnt = 0;
    int Array [10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int sum = 0;
    int Array2 [10] = {7, 2, 5, 11, 4, 6, 1, 1, 8, 3};
    int sum2 = 0;
    while (cnt < 10)
    {
        sum += Array[cnt];
        sum2 += Array2[cnt];
        cnt++;
    }
    // print test case 1
    float average = (float) sum / 10;
    printf("Average is: %.1f\n" , average);
    // print test case 2
    float average2 = (float) sum2 / 10;
    printf("Average is: %.1f\n" , average2);

}

void main(){

    avarage();
}

