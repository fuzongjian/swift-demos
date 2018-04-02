//
//  OcBlockController.h
//  swift-demos
//
//  Created by 付宗建 on 2018/4/2.
//  Copyright © 2018年 youran. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^returnBlock)(NSString * user);
@interface OcBlockController : UIViewController

- (void)getReturnValue:(returnBlock)block;
@end
