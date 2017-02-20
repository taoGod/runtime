//
//  UIButton+Swizzling.h
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/18.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Swizzling)

//点击间隔
@property (nonatomic, assign) NSTimeInterval timeInterval;
//用于设置单个按钮不需要被hook
@property (nonatomic, assign) BOOL isIgnore;

@end
