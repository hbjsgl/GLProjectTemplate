//
//  UIScrollView+Direction.m
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/26.
//  Copyright © 2017年 GL. All rights reserved.
//

#import "UIScrollView+Direction.h"
#import <objc/runtime.h>

#define GLKeyPath(objc,keyPath) @(((void)objc.keyPath,#keyPath))

static char * const gl_offsetYViewKey = "gy_offsetYViewKey";
static char * const scrollDirectionBlockKey = "scrollDirectionBlockKey";
static char * const isInitialKey = "isInitialKey";

@implementation UIScrollView (Direction)

- (CGFloat)gl_offsetY {
    
    return [objc_getAssociatedObject(self,gl_offsetYViewKey) floatValue];
}

- (void)setGl_offsetY:(CGFloat)gl_offsetY {
    
    objc_setAssociatedObject(self, gl_offsetYViewKey, @(gl_offsetY), OBJC_ASSOCIATION_ASSIGN);
    

    [self _addObserver];
}

- (BOOL)gl_isInitial
{
    return [objc_getAssociatedObject(self, isInitialKey) boolValue];
}

- (void)setGl_isInitial:(BOOL)gl_isInitial
{
    objc_setAssociatedObject(self, isInitialKey, @(gl_isInitial),OBJC_ASSOCIATION_ASSIGN);
}

- (void (^)(GL_ScrollDirection))scrollDirectionBlock {
    return objc_getAssociatedObject(self, scrollDirectionBlockKey);
}

- (void)setScrollDirectionBlock:(void (^)(GL_ScrollDirection))scrollDirectionBlock {
    objc_setAssociatedObject(self, scrollDirectionBlockKey, scrollDirectionBlock, OBJC_ASSOCIATION_COPY);
}

// KVO监听偏移量
- (void)_addObserver {
    if (self.gl_isInitial == NO) {
        [self addObserver:self forKeyPath:GLKeyPath(self, contentOffset) options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        self.gl_isInitial = YES;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    CGPoint old =  [change[@"old"] CGPointValue];
    CGPoint new =  [change[@"new"] CGPointValue];
    
    if (self.contentSize.height-CGRectGetHeight(self.frame)<self.gl_offsetY*2) {
        return;
    }
    
    if (self.contentSize.height-CGRectGetHeight(self.frame)-self.contentOffset.y<self.gl_offsetY) {
        return;
    }
    
    if ((new.y-old.y>self.gl_offsetY && new.y>0 && self.contentSize.height>CGRectGetHeight(self.frame)) || (self.contentSize.height-CGRectGetHeight(self.frame)<=self.contentOffset.y && self.contentSize.height>CGRectGetHeight(self.frame))) { // up hidden
        if (self.scrollDirectionBlock) {
            self.scrollDirectionBlock(ScrollDirectionForUp);
        }
    }else if((new.y<=0 || old.y-new.y>self.gl_offsetY)) { //down
        if (new.y==0) {return;}
        
        if (self.scrollDirectionBlock) {
            self.scrollDirectionBlock(ScrollDirectionForDown);
        }        
    }
}

- (void)dealloc
{
    if (self.gl_isInitial) { // 初始化过，就表示有监听contentOffset属性，才需要移除
        [self removeObserver:self forKeyPath:GLKeyPath(self, contentOffset)];
    }
}

@end
