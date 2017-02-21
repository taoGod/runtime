//
//  MethodAndMessageController.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/21.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "MethodAndMessageController.h"
#import "MyObject.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface MethodAndMessageController ()

@end

@implementation MethodAndMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self impInvoke];
}

- (void)impInvoke {
    void (*setter)(id, SEL, int);
    int i;
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:1000];
    for (int i = 0; i < 1000; i++) {
        arr[i] = [[MyObject alloc] init];
    }
    setter = (void (*)(id, SEL, int))[arr[0] methodForSelector:@selector(printNumber:)];
    for (i = 0 ; i < 1000 ; i++)
        setter(arr[i], @selector(printNumber:), i);
}

- (void)sendMessage {
    MyObject *obj = MyObject.new;
    SEL sel = @selector(printNumber:);
//    objc_msgSend(obj, sel, 5);
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
