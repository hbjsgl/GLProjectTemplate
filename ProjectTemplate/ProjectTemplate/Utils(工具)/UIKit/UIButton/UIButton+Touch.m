//
//  UIButton+Touch.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/9/3.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "UIButton+Touch.h"
#import <objc/runtime.h>

@interface UIButton()

//yes 不允许点击
@property (nonatomic,assign)BOOL isIgnoreEvent;

@end

@implementation UIButton (Touch)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(mySendAction:to:forEvent:);
        
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        
        //methodb 添加到系统方法中，将a方法指针添加成b方法
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        
        
        //b方法不存在，必须将b方法实现指针更换为方法a的，
        if (isAdd) {
            
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        }else {
            
            //添加失败，本类有b方法实现，只需要将a和b的imp互换一下
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (NSTimeInterval)timeInterval {
    
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//点击按钮时，会执行此方法
- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.isIgnore) {
        
        //不需要hook
        [self mySendAction:action to:target forEvent:event];
        return;
    }
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        
        self.timeInterval = self.timeInterval == 0 ? defaultInterval : self.timeInterval;
        
        if (self.isIgnoreEvent) {
            
            return;
        }else if (self.timeInterval > 0){
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
    }
    
    //a方法和b方法的imp互换了
    self.isIgnoreEvent = YES;
    
    [self setExclusiveTouch:YES];
    
    [self mySendAction:action to:target forEvent:event];
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnore {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)resetState {
    
    [self setIsIgnoreEvent:NO];
}

@end
