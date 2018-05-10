# C语言
### 基础
`C程序一定是从主函数开始执行`
- 结构
```
#include<stdio.h>
int main()
{
    printf("hello world");
    return 0;
}
```
- 常量定义
```
#define PI 3.14
```
- 自动类型转换

  `字节小的可以向字节大的自动转换，但字节大的不能向字节小的自动转换。`

  ![字节转换](/img/trans.png)

- 强行转换

  `1、数据类型和表达式都必须加括号`

  `2、转换后不会改变原数据的类型和变量值，只是本次运算中临时性转换`

  `3、强制转换后的运算结果不遵循四舍五入原则`
- 运算符号

  `1、C语言中没有乘方这个运算符，也不能用×、÷等运算符`

  `2、整数和整数相除结果也为整数。`

  `3、取余运算只适用两个整数进行取余运算。符号取决于除数。`
  ```
  10%3 = 1;
  (-10)%3 = -1;
  10%(-3) = 1
  3+4%7/3+12-4 = 3 + 1 + 8 = 12
  ```
  ![运算符](/img/count.png)
- 关系运算符

  ![比较](/img/compare.png)

- 逻辑运算符

  ![](/img/logic.png)

- 三目运算符

  `表达式1 ？ 表达式2 ： 表达式3`

  ```
  1 > 2 ? true : false
  ```
- 运算符优先级比较

  ![运算符优先级比较](/img/firstorlast.png)

- while、do-while、for循环

  `for循环中表达式1、表达式2、表达式3都可以省略，但分号（;）不能省`

  ![for循环](/img/for.png)


  | while | do-while | for |
  |:-----:|:--------:|:---:|
  |先判断 | 先执行一次，再判断 | 知道了循环次数 |

  - break

    `1、在没有循环结构的情况下，break不能用在单独的if-else语句中。`

    `2、在多层循环中，一个break语句只跳出当前循环。`

- continue

  `1、break是跳出当前循环，continue结束本次循环，开始下一次循环。`

  `2、continue只能用在循环体中`

- goto

  `goto语句是一种没有分支的语句`

  `goto 语句标号`

  ```
  #include <stdio.h>
  int main(int argc, const char * argv[]) {
      int sum = 0;
      int i = 0;
      // 定义有效标识符
      LOOP:if( i<=10 ){
          sum += i;
          i ++;
          // 转义到LOOP所在位置继续执行
          goto LOOP;
      }
      printf("%d\n",sum);
      return 0;
  }
  ```
  ### 函数

- 形参与实参

    `1、形参只有在被调用时才分配内存单元，在调用结束时，即释放所分配的内存单元。形参只要内部函数有效。`

    `2、实参可以是常量、变量、表达式、函数等，无论实参是何种变量，在进行函数调用时，都必须有确定的值。`

    `3、实参和形参在数量上、类型上、顺序上应严格一致。`

- 递归函数

    `1、递归就是一个函数在它的函数体内调用本身。`

    `2、递归函数必须有结束条件`
    ```
    // 阶乘计算递归
    int facorial(int n)
    {
        int result = 0;
        if (n < 0) {
            return 0;
        }else if (n == 0 || n == 1){
            return 1;
        }else{
            result = facorial(n-1)*n;
        }
        return result;
    }
    // 猴子吃桃问题
    int getPeachNumber(int n){
        int num = 0;
        if (n == 10) {
            return 1;
        }else{
            num = (getPeachNumber(n+1) + 1) * 2;
            printf("第%d天所剩桃子%d个\n", n, num);
        }
        return num;
    }
    ```
    ![递归函数](/img/digui.jpg)
- 变量存储

  `静态存储方式`
  ```
  1、是指在程序运行期间分配固定的存储空间的方式。
  2、静态存储区中存放了整个程序执行过程中都存在的变量。如全局变量。
  ```
  `动态存储方式`
  ```
  1、是指在程序运行期间需要进行动态的分配存储空间的方式。
  2、动态存储区中存放的变量是根据程序运行的需要而建立和释放的。如形参、自动变量等。
  ```


| 存储方式 | 解释 | 存储方式 |
|:------:|:-----:|:-----:|
| 自动（auto）| 自动变量 | 动态存储 |
| 静态（static）| 静态变量，分静态局部变量和静态外部变量 | 静态存储 |
| 寄存器（register）| 寄存器变量（为了提高效率，C语言允许将局部变量放在CPU中的寄存器中） |  |
|外部（extern）| 外部变量（意义是可以调用在函数之后定义的变量） | |

- 内部函数与外部函数

  `1、内部函数：不能被其他源文件调用的函数是内部函数，用static关键字来定义`

  `2、外部函数：可以被其他源文件调用的函数是外部函数，用extern关键字来定义，默认就是extern`
### 数组
- 数组初始化的三种方式

  `1、数据类型 数组名称[长度n] = {元素1，元素2...元素n};`

  `2、数据类型 数组名称[] = {元素1，元素2...元素n};`

  `3、数据类型 数组名称[长度n];数组名称[0]=元素1...数组名称[n-1]=元素n`
- 数组遍历

  `1、避免出现数组越界访问。`

  `2、C语言的数组长度一经声明，长度就是固定，无法改变，并且C语言并不提供计算数组长度的方法。`
  ```
  //  数组循环
  void array(){
      int arr[] = {1,2,3};
      for (int i = 0; i < 3; i++) {
          printf("%d\n",arr[i]);
      }
  }
  ```
- 数组作为函数的参数
  ```
  // 数组作为参数
  void test(int arr[]){
      for (int i = 0; i < 3; i++) {
          printf("--%d\n",arr[i]);
      }
  }
  ```
- 冒泡排序

  `相邻元素两两比较，将较大的数字放在后面，直到将所有数字全部排序。`
  ```
  // 冒泡排序  由大到小
  void sort(){
      double arr[]={1.78, 1.77, 1.82, 1.79, 1.85, 1.75, 1.86, 1.77, 1.81, 1.80};
      for (int i = 0; i < 10; i ++) {
          for (int j = i + 1; j < 10; j ++) {
              if (arr[i] < arr[j]) {
                  double temp = arr[i];
                  arr[i] = arr[j];
                  arr[j] = temp;
              }
          }
      }
      for (int i = 0; i < 10; i ++) {
          printf("%.2f\n",arr[i]);
      }
  }
  ```
- 字符串与数组

    `1、char 字符串名称[长度]="字符串"`

    `2、char 字符串名称[长度]={'字符串1','字符串1','字符串1','\0'}`

    `注意:`

    `1、[]中的长度是可以省略不写的`

    `2、采用第二种方式最后一个元素必须是'\0','\0'表示字符串的结束表示`

    `3、采用第二方式的时候数组中不能写中文。`
    ```
    // 字符串
    void char_test(char str[]){// 注意参数的书写
        char string[] = "求知若渴，虚怀若谷。";
        char string1[] = {'h','e','l','l','o',' ','w','o','r','l','d','.','\0'};
        printf("%s\n",string);
        printf("%s\n",string1);
    }
    ```
- 字符串函数

  ![字符串函数](/img/string_C.png)


  | 字符串函数 | 注意问题 |
  |:----:|:------:|
  | strlen() | 在字符串长度中是不包括'\0',而且汉字和字母的长度是不一样的 |
  | strcmp() | 首先把字符串转成ASCII码，然后再进行比较。（0=，1>，-1<）|
  | strcpy() | 拷贝之后会覆盖原来字符串且不能对字符串常量进行拷贝 |
  | strcat() | s1和s2所指的内存空间不能重叠，且s1要有足够的空间来容纳要复制的字符串 |

  ```
    void compare(){
      // strlen()
      char str1[] = "求知若渴，虚怀若谷！";
      char str2[] = {'h','e','l','l','o',' ','w','o','r','l','d','.','\0'};
      printf("%d---%d\n",strlen(str1),strlen(str2));
      // strcmp()
      char a[] = "a";
      char b[] = "b";
      printf("%d\n",strcmp(a,b));
      // strcopy()
      printf("%s\n",strcpy(a,b));
      // strcat()
      char c[10] = "c";
      printf("%s\n",strcat(c, b));
    }
  ```

- 多维数组

    `1、数据类型 数组名称[常量表达式1][常量表达式2]...[常量表达式n] = {{值1,..,值n},{值1,..,值n},...,{值1,..,值n}};`

    `2、数据类型 数组名称[常量表达式1][常量表达式2]...[常量表达式n]; 数组名称[下标1][下标2]...[下标n] = 值;`

    `注：`

    `1、采用第一种初始化声明必须指定列的维数。因为系统会根据数组中元素的总个数来分配空间，当知道元素总个数及列的维数后，会直接计算出行的维数。`

    `2、采用第二种初始化时数组声明必须同时指定行和列的维数。`
### 指针
`指针`是一个变量，其值为另一个变量的地址，即内存位置的直接地址。

- 指针类型

| 类型 | 描述 |
|:---:|:----:|
| int *ip | 一个整型的指针 |
| double *dp | 一个double型的指针 |
| float * fp | 一个浮点型的指针 |
| char * ch | 一个字符型的指针 |
```
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
```
- 递增指针
> 指针代替数组，因为变量指针可以递增，而数组不能递增，应为数组是一个常量指针。
```
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
```
- 函数指针
> 函数指针是指向函数的指针变量。
```
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
```
### 内存

| 函数 | 描述 |
|:---:|:----:|
| void *calloc(int num,int size)| 在内存中动态分配num个长度为size的连续空间，并将每个字节都初始化为0。即它的结果是分配了num*size个字节长度的内存空间，并且每个字节的值都是0 |
| void free(void *address) | 该函数释放address所指向的内存块，释放的是动态分配的内存空间 |
| void *malloc(int num) | 在堆区分配一块指定大小的内存空间，用来存放数据。这块内存空间在函数执行完成后不会被初始化，他们的值是未知的。
| void *realloc(void *address,int newsize) | 该函数重新分配内存，把内存扩展到newsize |
- 动态分配内存
> 预先知道数组的大小，定义数组就比价容易；事先不知道的话，需要定义一个指针 ，指向未定所需内存大小的字符，后续在根据需要来分配内存。
```
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
```
### 经典实例
- 二进制与十进的相互转换
```
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
```
