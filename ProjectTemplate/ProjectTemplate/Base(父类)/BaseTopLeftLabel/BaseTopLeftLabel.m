//
//  BaseTopLeftLabel.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//Copyright © 2017年 guolei. All rights reserved.
//

#import "BaseTopLeftLabel.h"

@implementation BaseTopLeftLabel


#pragma mark - ----------   Lifecycle（生命周期） ----------


#pragma mark - ---------- Private Methods（私有方法） ----------
#pragma mark config control（布局控件）
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    textRect.origin.y = bounds.origin.y;
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

#pragma mark - ---------- Public Methods（公有方法） ----------
#pragma mark setter （重写set方法）



@end
