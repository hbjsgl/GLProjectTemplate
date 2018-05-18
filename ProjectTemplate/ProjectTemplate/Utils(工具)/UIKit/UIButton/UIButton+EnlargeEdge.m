//
//  UIButton+EnlargeEdge.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import "UIButton+EnlargeEdge.h"
#import <objc/runtime.h>

#define keyTopEdge  @"keyTopEdge"
#define keyleftEdge  @"keyTopEdge"
#define keybottomEdge  @"keyTopEdge"
#define keyrightEdge  @"keyTopEdge"
@implementation UIButton (EnlargeEdge)

- (void)setEnlargeEdge:(CGFloat)size {
    
    objc_setAssociatedObject(self, keyTopEdge, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keyleftEdge, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keybottomEdge, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keyrightEdge, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left {
    
    objc_setAssociatedObject(self, keyTopEdge, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keyleftEdge, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keybottomEdge, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, keyrightEdge, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}


//使用bounds来增大点击区域
- (CGRect)enlargedRect {
    
    NSNumber* topEdge = objc_getAssociatedObject(self, keyTopEdge);
    NSNumber* leftEdge = objc_getAssociatedObject(self, keyleftEdge);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, keybottomEdge);
    NSNumber* rightEdge = objc_getAssociatedObject(self, keyrightEdge);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else {
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}


@end
