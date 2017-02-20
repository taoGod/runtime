//
//  MyClass.h
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/20.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;

@end
