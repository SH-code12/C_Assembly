#include<stdio.h>

int count(){

    printf("Asmaa Atef ^_^\n");
    int cnt = 0;
    int Array [10] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int count1 = 0;
    int Array2 [10] = {19, 2, 3, 7, 5, 10, 9, 0, 6, 1};
    int count2 = 0;
    while (cnt < 10)
    {
        if (Array[cnt] % 2 == 0)
        {
            count1++;
        }
        if (Array2[cnt] % 2 == 0)
        {
            count2++;
        }
        cnt++;
    }
    // print test case 1
    printf("Count of even numbers is: %d\n" , count1);
    // print test case 2
    printf("Count of even numbers is: %d\n" , count2);
}
void main(){

    count();
}
