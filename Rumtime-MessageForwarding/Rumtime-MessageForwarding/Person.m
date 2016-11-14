//
//  Person.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 16/11/5.
//  Copyright © 2016年 juliu. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
#import <objc/runtime.h>

void functionForMethod1(id self, SEL _cmd) {
    NSLog(@"obj:%@, _cmd:%p, _cmdStr:%@", self, _cmd, NSStringFromSelector(_cmd));
}

@interface Person ()

@property (nonatomic, strong) Dog *dog;

@end

@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        self.dog = [[Dog alloc] init];
    }
    return self;
}

// 1:如果是 实例 找不到不方法则会跑到该方法.如果是 类 找不到类方法则会跑到+resolveClassMethod:
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString isEqualToString:@"method1"]) {
        class_addMethod(self.class, @selector(method1), (IMP)functionForMethod1, "@:");
    }
    return [super resolveInstanceMethod:sel];
}

// 2:如果 1 解决不了,则跑到该方法
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    NSString *selectorString = NSStringFromSelector(aSelector);
    // 将消息转发给 self.dog 来处理
    if ([selectorString isEqualToString:@"method2"]) {
        return self.dog;
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 3:如果 1或者2 都解决不了,则通过下面的方法实现完整转发.另外需要实现 -methodSignatureForSelector:,它帮助创建anInvocation对象
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([Dog instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.dog];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([Dog instancesRespondToSelector:aSelector]) {
            signature = [Dog instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}


@end
