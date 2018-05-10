//
//  main.c
//  helloworld
//
//  Created by 付宗建 on 2018/4/15.
//  Copyright © 2018年 youran. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
void pointerMethod(){
    // 实际变量的声明
    int var = 20;
    // 指针变量的声明
    int *ip;
    // 在指针变量存储var的地址
    ip = &var;
    // 访问指针变量存储的地址、使用指针访问值
    printf("%p---%p---%d\n",&var,ip,*ip);
}
void operationMethod(){
    int var[] = {10,20,30};
    int i,*pr,*ptr;
    // 指针中的数组地址(递增)
    pr = var;
    for (i = 0; i < 3; i ++) {
        printf("存储地址：var[%d] = %p\n",i,pr);
        printf("存储值： var[%d] = %d\n",i,*pr);
        // 移到下一个位置
        pr++;
    }
    // 指针中的数组地址(递减)
    ptr = &var[2];
    for (int i = 3; i > 0; i --) {
        printf("存储地址：var[%d] = %p\n",i-1,ptr);
        printf("存储值： var[%d] = %d\n",i-1,*ptr);
        // 移到下一个位置
        ptr--;
    }
}
int max(int x,int y){
    return x > y ? x : y;
}
void methodPointer(){
    // p是函数指针
    int (* p)(int,int) = &max;
    int a,b,c,d;
    printf("请输入三个数：");
    scanf("%d %d %d",&a,&b,&c);
    // 与直接调用函数等价，d=max(max(a,b),c)
    d = p(p(a,b),c);
    printf("最大的数字是: %d\n",d);
}
void memoryMethod(){
    char name[100];
    char * des;
    strcpy(name, "hello char");
    // 动态分配内存
    des = malloc(100 * sizeof(name));
    if (des == NULL) {
        fprintf(stderr, "Error - unable to allocate required memoty\n");
    }else{
        strcpy(des, "good good study,day day up.");
    }
    printf("name === %s\n",name);
    printf("des: %s \n",des);
    // 如果需要更大的内存
    des = realloc(des, 100*sizeof(char));
    if (des == NULL) {
        fprintf(stderr, "Error - unable to allocate required memoty\n");
    }else{
        strcat(des, "she is class 10th.");
    }
    printf("name === %s\n",name);
    printf("des: %s \n",des);
    // 使用free()释放
    free(des);
}
void convertBinary(){
    int n ;
    printf("请输入一个十进制数:");
    scanf("%d",&n);
    int temp = n;
    long long binaryNum = 0;
    int remainder,i=1,step=1;
    while (n!=0) {
        remainder = n%2;// 余数
        printf("Step %d: %d/2,余数 = %d,商 = %d\n",step++,n,remainder,n/2);
        n /= 2; // 商继续除
        binaryNum += remainder * i;
        i *= 10;
    }
    printf("十进制数 %d 转换为二进制位 %lld\n",temp,binaryNum);
    int result = 0;
    long long newtemp = binaryNum;
    i = 0;
    while (binaryNum !=0) {
        remainder = binaryNum%10;
        binaryNum /= 10;
        result += remainder*pow(2, i);
        ++i;
    }
    printf("二进制数 %lld 转换为十进制为 %d\n",newtemp,result);
}
void reverseString(){
    char str[100] = "fuzongjian";
    printf("转换前: %s\t",str);
    int i = 0;
    int j = (int)strlen(str) - 1;
    char temp;
    while (i < j) {
        temp = *(str+i);
        *(str+i) = *(str+j);
        *(str+j) = temp;
        i++;
        j--;
    }
    printf("转换后：%s\n",str);
}
void swapValue(){
    int a,b,c;
    printf("请输入a，b，c的值：");
    scanf("%d%d%d",&a,&b,&c);
    printf("%p--%p---%p\n",&a,&b,&c);

    
}
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
//    pointerMethod();
//    operationMethod();
//    methodPointer();
//    memoryMethod();
//    convertBinary();
//    reverseString();
    swapValue();
    return 0;
}
