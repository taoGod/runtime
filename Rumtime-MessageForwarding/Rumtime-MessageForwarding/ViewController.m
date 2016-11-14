//
//  ViewController.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 16/11/5.
//  Copyright © 2016年 juliu. All rights reserved.
//


/*
 触发条件:
   默认情况下，如果是以[object message]的方式调用方法，如果object无法响应message消息时，编译器会报错。但如果是以perform...的形式来调用，则需要等到运行时才能确定object是否能接收message消息。如果不能，则程序崩溃。
   通常，当我们不能确定一个对象是否能接收某个消息时，会先调用respondsToSelector:来判断一下。
   不过，我们不使用respondsToSelector:。当一个对象无法接收某一消息时，就会启动所谓”消息转发(message forwarding)“机制。
 
 消息转发机制三个步骤:
   动态方法解析; +resolveInstanceMethod:/+resolveClassMethod:
   备用接收者; -forwardingTargetForSelector:
   完整转发。 -forwardInvocation:
 */
#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

// 动态方法解析
- (IBAction)resolveInstanceMethodClick:(UIButton *)sender {
    Person *p = [Person new];
    
    [p performSelector:@selector(method1)];
}

// 备用接收者
- (IBAction)forwardingTargetClick:(UIButton *)sender {
    Person *p = [Person new];
    
    [p performSelector:@selector(method2)];
}

// 完整转发
- (IBAction)forwardInvocationClick:(UIButton *)sender {
    Person *p = [Person new];
    
    [p performSelector:@selector(method3)];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
