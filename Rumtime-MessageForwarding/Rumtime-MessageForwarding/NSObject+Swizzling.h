//
//  NSObject+Swizzling.h
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/18.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;

@end
