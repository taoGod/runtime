//
//  IvarAndPropertyController.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/20.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "IvarAndPropertyController.h"

@interface IvarAndPropertyController ()

@end

@implementation IvarAndPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self typeEncode];
}

- (void)typeEncode {
    float a[] = {1.0, 2.0, 3.0};
    NSLog(@"array encoding type: %s", @encode(typeof(a)));

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
