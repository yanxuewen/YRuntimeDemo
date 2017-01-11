//
//  NSString+YCategory.m
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/10.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import "NSString+YCategory.h"
#import <objc/runtime.h>

static const void *kStringLength = "kStringLength";

@implementation NSString (YCategory)
@dynamic stringLength;

- (void)setStringLength:(NSUInteger)stringLength {
    objc_setAssociatedObject(self, kStringLength, @(stringLength), OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger)stringLength {
    id len = objc_getAssociatedObject(self, kStringLength);
    return [len unsignedIntegerValue];
}

@end
