//
//  OcBlockController.m
//  swift-demos
//
//  Created by 付宗建 on 2018/4/2.
//  Copyright © 2018年 youran. All rights reserved.
//

#import "OcBlockController.h"
#import "Person.h"
typedef void(^FJBlock)(void);
typedef void(^ZJBlock)(OcBlockController *);
@interface OcBlockController ()
@property (nonatomic,copy) returnBlock blockValue;
@property (nonatomic,copy) FJBlock block;
@property (nonatomic,copy) ZJBlock zjBlock;
@property (nonatomic,copy) NSString * name;
@end

@implementation OcBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    // Do any additional setup after loading the view.
}
- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self noParaNoReturn:@"fuzonjian" completed:^{
        NSLog(@"1---hello world");
    }];
    [self paraReturn:@"fuzongjian" completed:^(int value1, int value2) {
        NSLog(@"2---a=%d-b=%d",value1,value2);
    }];
    
    UIButton * bakcBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [bakcBtn setTitle:@"返回" forState:UIControlStateNormal];
    bakcBtn.frame = CGRectMake(20, 100, 200, 40);
    [bakcBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bakcBtn];
    
    //
    [self testBlock];
    
    [self typeBlock];
    
    [self circleBlock3];
}
- (void)circleBlock3{
    self.name = @"fuzongjian";
    // 强弱共舞
    self.zjBlock = ^(OcBlockController * vc){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            vc.name = @"hello world";
            NSLog(@" === %@",vc.name);
        });
    };
    self.zjBlock(self);
}
- (void)circleBlock2{
    self.name = @"fuzongjian";
    __block OcBlockController * vc = self;
    // 强弱共舞
    self.block = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            vc.name = @"hello world";
            NSLog(@" === %@",vc.name);
            vc = nil;
        });
    };
    self.block();
}
- (void)circleBlock1{
    self.name = @"fuzongjian";
    __weak typeof(self) weakSelf = self;
    // 强弱共舞
    self.block = ^{
        // 临时变量会自动加到autorealsepool中， 自动释放。
        __strong typeof(self) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            strongSelf.name = @"hello world";
            NSLog(@" === %@",strongSelf.name);
        });
    };
    self.block();
}
- (void)typeBlock{
    /* 三种block
     * 栈    <__NSStackBlock__: 0x7ffee9fb8298>
     * 堆    <__NSMallocBlock__: 0x60000369cdb0>
     * 全局  <__NSGlobalBlock__: 0x10f995c58>
     */
    void (^block1)(void) = ^{
        NSLog(@"hello block");
    };
    NSLog(@"global === %@",block1);
    
    // 捕获外界变量 --copy-- 将栈区拷贝到堆区
    int a = 10;
    void (^block2)(void) = ^{
        NSLog(@"hello block---%d",a);
    };
    NSLog(@"malloc === %@",block2);
    
    NSLog(@"stack === %@",^{
        NSLog(@"hello block---%d",a);
    });
}
- (void)testBlock{
    Person * person = [[Person alloc] init];
//    Person * weakPerson = person;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [person test];
        NSLog(@"%@",person);
    });
}
// 界面传值
- (void)getReturnValue:(returnBlock)block{
    self.blockValue = block;
}
- (void)noParaNoReturn:(NSString *)name completed:(void(^)(void))complete{
    NSLog(@"1---name=%@",name);
    complete();
}
- (void)paraReturn:(NSString *)name completed:(void(^)(int value1,int value2))completed{
    NSLog(@"2---name=%@",name);
    completed(10,20);
}
- (void)backBtnClicked:(UIButton *)sender{
//    self.blockValue(@"hello oc block");
    if (self.blockValue) {
        self.blockValue(@"hello oc block");
    }
    [self.navigationController popViewControllerAnimated:true];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}
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
