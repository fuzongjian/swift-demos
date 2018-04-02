//
//  PropertyController.m
//  swift-demos
//
//  Created by 付宗建 on 2018/4/2.
//  Copyright © 2018年 youran. All rights reserved.
//

#import "PropertyController.h"
#import "User.h"
@interface PropertyController ()
@property (nonatomic, copy) NSMutableArray * mutableArray;
@property (nonatomic,strong) NSString * strongStr;
@property (nonatomic,weak) NSString * weakStr;
@property (nonatomic,copy) NSString * cyString;
@end

@implementation PropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self testCopy];
}
/*
 *  strong: 在ARC环境下等同于retain，声明属性的默认关键字（浅拷贝，拷贝指针）
 *  copy: 深拷贝，拷贝内容，copy就是复制一个不可变object的对象
 */
- (void)testCopy{
    NSMutableString * string = [[NSMutableString alloc] initWithString:@"fuzongjian"];
    NSMutableArray * array = [[NSMutableArray alloc] initWithObjects:string, nil];
    // copy 只是拷贝了内容
    self.mutableArray = array;
    [string deleteCharactersInRange:NSMakeRange(1, 1)];
    NSLog(@"%@",self.mutableArray);
    
    /*
     *  NSString类型的赋值默认会加上copy，而copy会创建一个新的对象，下面代码可写成这样
     *  self.strongStr = [@"fuzongjian" copy];
     *  self.weakStr = [self.strongStr copy];
     */
    self.strongStr = @"fuzongjian";
    self.weakStr = self.strongStr;
    self.cyString = self.strongStr;
    self.strongStr = nil;
    NSLog(@"strong === %@,weak === %@,copy === %@",self.strongStr,self.weakStr,self.cyString);
    
    NSString * name = @"fuzongjian";
    User * user = [[User alloc] init];
    user.name = name;
    NSLog(@"name === %@",user.name);
    name = @"hello world";
    NSLog(@"name === %@",user.name);
    
}
/*
 * assign: 基础数据烈性（NSInteger、CGFloat）和C数据类型（int、float、double、char等）使用
 * weak: 对象销毁之后会自动置为nil，防止野指针
 */

/* 原子操作
 * atomic: 置成员变量@property属性时，默认为atomic，提供多线程安全，在多线程环境下，原子操作是必要的，否则有可能引起错误的结果
 *         atomic的线程安全开销比较大，影响性能。
 * nonatomic: 非原子性访问，对属性赋值的时候不加锁，多线程并发访问会提高性能。如果不加此属性，默认原子操作
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
