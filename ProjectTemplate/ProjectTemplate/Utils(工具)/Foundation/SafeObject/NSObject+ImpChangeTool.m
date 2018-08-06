//
//  NSObject+ImpChangeTool.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "NSObject+ImpChangeTool.h"
#import <objc/runtime.h>

@implementation NSObject (ImpChangeTool)


+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString {
    
    //获取系统方法IMP
    Method sysMethod = class_getInstanceMethod(NSClassFromString(systemClassString), NSSelectorFromString(systemClassString));
    //自定义方法的IMP
    Method safeMethod = class_getInstanceMethod(NSClassFromString(targetClassString), NSSelectorFromString(safeMethodString));
    //IMP交换
    method_exchangeImplementations(safeMethod, sysMethod);
}

@end
