//
//  UINavigationItem+Swizzling.m
//  Rumtime-MessageForwarding
//
//  Created by juliu on 17/2/18.
//  Copyright © 2017年 juliu. All rights reserved.
//

#import "UINavigationItem+Swizzling.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

static char *kCustomBackButtonKey;

@implementation UINavigationItem (Swizzling)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(backBarButtonItem)
                               bySwizzledSelector:@selector(sure_backBarButtonItem)];
        
    });
}

- (UIBarButtonItem*)sure_backBarButtonItem {
    UIBarButtonItem *backItem = [self sure_backBarButtonItem];
    if (backItem) {
        return backItem;
    }
    backItem = objc_getAssociatedObject(self, &kCustomBackButtonKey);
    if (!backItem) {
        backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
        objc_setAssociatedObject(self, &kCustomBackButtonKey, backItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return backItem;
}
@end
