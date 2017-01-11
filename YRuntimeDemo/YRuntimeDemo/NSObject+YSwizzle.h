//
//  NSObject+YSwizzle.h
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/10.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YSwizzle)

+ (void)swizzleSelector:(SEL)originSel replaceSel:(SEL)replaceSel;

@end
