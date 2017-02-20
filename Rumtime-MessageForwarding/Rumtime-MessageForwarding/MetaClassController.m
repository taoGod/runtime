//
//  MetaClassController.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/18.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "MetaClassController.h"
#include <objc/runtime.h>

void ReportFunction(id self, SEL _cmd) {
    NSLog(@"This object is %p.", self);
    NSLog(@"Class is %@, and super is %@.", [self class], [self superclass]);
    
    Class currentClass = [self class];
    for (int i = 1; i < 5; i++)
    {
        NSLog(@"Following the isa pointer %d times gives %p", i, currentClass);
        currentClass = object_getClass(currentClass);
    }
    
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's superclass is %p", [NSObject superclass]);
    NSLog(@"NSObject's meta class is %p", object_getClass([NSObject class]));
}

@interface MetaClassController ()

@end

@implementation MetaClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
// 运行时创建的类如果不销毁，就会一直存在于内存中
Class newClass = objc_allocateClassPair([NSError class], "RuntimeErrorSubclass", 0);
class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
objc_registerClassPair(newClass);

Class clazz = NSClassFromString(@"RuntimeErrorSubclass");
id instanceOfNewClass = [[clazz alloc] initWithDomain:@"someDomain" code:0 userInfo:nil];
[instanceOfNewClass performSelector:@selector(report)];

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    // 销毁该类
    objc_disposeClassPair(clazz);
});
//    [instanceOfNewClass release];
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
