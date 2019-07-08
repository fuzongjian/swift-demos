//
//  KVOController.m
//  swift-demos
//
//  Created by 付宗建 on 2019/7/5.
//  Copyright © 2019年 youran. All rights reserved.
//

#import "KVOController.h"
#import <objc/runtime.h>
#import "Human.h"
@interface KVOController()
@property (nonatomic,strong) Human * man;
@end
@implementation KVOController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getMethod];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}
- (void)getMethod{
    Human * obj = [[Human alloc] init];
    [obj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld| NSKeyValueObservingOptionNew context:nil];
    Class class = objc_getClass("NSKVONotifying_Human");
    unsigned int methodCount = 0;
    Method * methods = class_copyMethodList(class, &methodCount);
    NSLog(@"methodCount === %d",methodCount);
    for (int i = 0; i < methodCount; i ++) {
        Method method = methods[i];
        const char * name = sel_getName(method_getName(method));
        const char * typeEncoding = method_getTypeEncoding(method);
        NSLog(@"methodName: %s, methodTypeEncoding: %s",name,typeEncoding);
    }
//    obj.name = @"fuzongjian";
//    SEL sel = sel_registerName("_isKVOA");
//    BOOL isKVOA = ((bool(*)(id,SEL))objc_msgSend)(obj,sel);
//    NSLog(@"isKVOA == %d",isKVOA);
    
}
- (void)getProperty{// 查看成员变量和属性
    Human * obj = [[Human alloc] init];
    [obj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld| NSKeyValueObservingOptionNew context:nil];
    Class class = objc_getClass("NSKVONotifying_Human");
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList(class, &count);
    NSMutableArray * ivarsArray = @[].mutableCopy;
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char * _ivar = ivar_getName(ivar);
        NSString * ivarName = [NSString stringWithUTF8String:_ivar];
        [ivarsArray addObject:ivarName];
    }
    NSLog(@"count: %@ ivarArray: %@",@(count),ivarsArray);
    
    unsigned int propertyCount = 0;
    objc_property_t * propeties = class_copyPropertyList(class, &propertyCount);
    NSMutableArray * propertyArray = @[].mutableCopy;
    for (int i = 0; i < propertyCount; i ++) {
        objc_property_t property = propeties[i];
        const char * _property = property_getName(property);
        NSString * propertyName = [NSString stringWithUTF8String:_property];
        [propertyArray addObject:propertyName];
    }
    NSLog(@"propertyCount: %@ propertyArray: %@",@(propertyCount),propertyArray);
    
}
- (void)getSuper{
    Human * obj = [[Human alloc] init];
    Class objClass = object_getClass(obj);
    Class metaClass = object_getClass(objClass);
    NSLog(@"--------------添加观察者之前--------------");
    NSLog(@"class: %@",objClass);
    NSLog(@"metaclass: %@",metaClass);
    Class superClass = class_getSuperclass(objClass);
    Class superMetaClass = class_getSuperclass(metaClass);
    NSLog(@"superclass === %@",superClass);
    NSLog(@"supermetaclass === %@",superMetaClass);
    [obj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld| NSKeyValueObservingOptionNew context:nil];
    NSLog(@"--------------添加观察者之后--------------");
    Class obj_Class = object_getClass(obj);
    Class meta_Class = object_getClass(obj_Class);
    NSLog(@"class: %@",obj_Class);
    NSLog(@"metaclass: %@",meta_Class);
    Class super_Class = class_getSuperclass(obj_Class);
    Class superMeta_Class = class_getSuperclass(meta_Class);
    NSLog(@"superclass === %@",super_Class);
    NSLog(@"supermetaclass === %@",superMeta_Class);
    Class super_superClass = class_getSuperclass(super_Class);
    Class super_superMetaClass = class_getSuperclass(superMeta_Class);
    NSLog(@"super_superClass === %@",super_superClass);
    NSLog(@"super_superMetaClass === %@",super_superMetaClass);
}
- (void)getChange{
    Human * obj = [[Human alloc] init];
    NSMutableArray * before = @[].mutableCopy;
    NSMutableArray * after = @[].mutableCopy;
    unsigned int count = 0;
    Class * classes = objc_copyClassList(&count);
    for (int i = 0; i < count; i ++) {
        Class class = classes[i];
        const char * name = class_getName(class);
        NSString * className = [NSString stringWithUTF8String:name];
        [before addObject:className];
    }
    [obj addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld| NSKeyValueObservingOptionNew context:nil];
    unsigned int _count = 0;
    Class * _classes = objc_copyClassList(&_count);
    for (int i = 0; i < _count; i ++) {
        Class _class = _classes[i];
        const char * _name = class_getName(_class);
        NSString * _className = [NSString stringWithUTF8String:_name];
        [after addObject:_className];
    }
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",before];
    NSArray * result = [after filteredArrayUsingPredicate:predicate];
    NSLog(@"%@",result);
    /*
     *  输出  "NSKVONotifying_Human"
     *  观察者注册前后，系统注册的列表里多出了一类 NSKVONotifying_Human
     */
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
