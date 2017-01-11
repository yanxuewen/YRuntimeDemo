//
//  ViewController.m
//  YRuntimeDemo
//
//  Created by yanxuewen on 2017/1/10.
//  Copyright © 2017年 YXW. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+YSwizzle.h"
#import "NSObject+DLIntrospection.h"
#import "NSString+YCategory.h"
#import "YTestObject.h"
#import "YTestObjectB.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    NSLog(@"%s",__func__);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [ViewController swizzleSelector:@selector(viewWillAppear:) replaceSel:@selector(my_viewWillAppear:)];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"abc";
    
    str.stringLength = 5;
    NSLog(@"%zi",str.stringLength);
    
    NSString *obj = [YTestObject new];
    [obj uppercaseString];
    NSString *abc = [obj lowercaseString];
    NSLog(@"abc:%@",abc);
    NSArray *arr = [obj componentsSeparatedByString:@"-"];
    NSLog(@"arr:%@",arr);
    [obj capitalizedString];
   
    obj = [YTestObjectB new];
    [obj uppercaseString];
    [obj componentsSeparatedByString:@"1"];
}

- (void)my_viewWillAppear:(BOOL)animated {
    [self my_viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (IBAction)btnAction:(id)sender {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] performSelector:@selector(suspend)];
//    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
