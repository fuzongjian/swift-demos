//
//  main.c
//  helloworld
//
//  Created by 付宗建 on 2018/4/15.
//  Copyright © 2018年 youran. All rights reserved.
//

#include <stdio.h>

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
void operationMethod2(){
    
}
int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
//    pointerMethod();
    operationMethod();
    
    return 0;
}
