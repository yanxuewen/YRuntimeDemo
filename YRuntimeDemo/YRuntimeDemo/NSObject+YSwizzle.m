//
//  NSObject+YSwizzle.m
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/10.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import "NSObject+YSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (YSwizzle)

+ (void)swizzleSelector:(SEL)originSel replaceSel:(SEL)replaceSel {
    Method originalMethod = class_getInstanceMethod(self, originSel);
    Method overrideMethod = class_getInstanceMethod(self, replaceSel);
    if (class_addMethod(self, originSel, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(self, replaceSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, overrideMethod);
    }
}

@end
