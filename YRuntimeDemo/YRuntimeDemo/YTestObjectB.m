//
//  YTestObjectB.m
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/11.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import "YTestObjectB.h"
#import <objc/runtime.h>

@implementation YTestObjectB

- (NSString *)lowercaseString {
    NSLog(@"%s",__func__);
    return @"abc";
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s",__func__);
    class_addMethod([self class], sel, (IMP)helpFunc, "v@:");
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s",__func__);
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s",__func__);
    [super forwardInvocation:anInvocation];
}

void helpFunc(id self,SEL _cmd) {
    NSLog(@"%s",__func__);
}


@end
