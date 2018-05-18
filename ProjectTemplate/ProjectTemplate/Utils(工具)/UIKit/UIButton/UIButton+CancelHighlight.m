//
//  UIButton+CancelHighlight.m
//  WuchangPortal
//
//  Created by 郭磊 on 2017/12/26.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import "UIButton+CancelHighlight.h"
#import <objc/runtime.h>

@implementation UIButton (CancelHighlight)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        Class class = [self class];
        
        SEL originalSelector = @selector(setHighlighted:);
        SEL swizzledSelector = @selector(cancel_setHighlighted:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        //交换实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

#pragma mark - Method Swizzling
- (void)cancel_setHighlighted:(BOOL)highlighted {
    
    //取消按钮的的高亮状态，所以没有做任何操作
}

@end
