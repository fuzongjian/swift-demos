//
//  OcBlockController.m
//  swift-demos
//
//  Created by 付宗建 on 2018/4/2.
//  Copyright © 2018年 youran. All rights reserved.
//

#import "OcBlockController.h"
typedef void(^returnBlock)(NSString * user);
@interface OcBlockController ()
@property (nonatomic,copy) returnBlock blockValue;
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
}
- (void)blcokHelloComplete:(returnBlock)complete{
    complete = self.blockValue;
}
- (void)noParaNoReturn:(NSString *)name completed:(void(^)(void))complete{
    NSLog(@"1---name=%@",name);
    complete();
}
- (void)paraReturn:(NSString *)name completed:(void(^)(int value1,int value2))completed{
    NSLog(@"2---name=%@",name);
    completed(10,20);
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
