//
//  NSObject+Swizzling.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector {
    
    Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(selfClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        
        class_replaceMethod(selfClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
