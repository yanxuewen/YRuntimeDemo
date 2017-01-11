//
//  YTestObject.m
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/10.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import "YTestObject.h"
#import <objc/runtime.h>
#import "YTestObjectB.h"

@implementation YTestObject

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s",__func__);
    if (sel == @selector(uppercaseString)) {
        return class_addMethod([self class], sel, (IMP)uppercaseString, "v@:");
    } else if (sel == @selector(componentsSeparatedByString:)) {
        return class_addMethod([self class], sel, (IMP)componentsSeparatedByString, "[]@:@");
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s",__func__);
    if (aSelector == @selector(lowercaseString)) {
        return [YTestObjectB new];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s",__func__);
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s",__func__);
    if (anInvocation.selector == @selector(capitalizedString)) {
        [anInvocation invokeWithTarget:[YTestObjectB new]];
        return;
    }
    [super forwardInvocation:anInvocation];
}


void uppercaseString(id self,SEL _cmd) {
    NSLog(@"%s",__func__);
}

NSArray * componentsSeparatedByString(id self,SEL _cmd,id arg) {
    return @[@"a",@"b",@"c"];
}

@end
