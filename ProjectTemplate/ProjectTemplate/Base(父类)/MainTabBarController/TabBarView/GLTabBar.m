//
//  GLTabBar.m
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/24.
//Copyright © 2017年 GL. All rights reserved.
//

#import "GLTabBar.h"

@interface GLTabBar()

@property (nonatomic,assign)UIEdgeInsets oldSafeAreaInsets;

@end

@implementation GLTabBar


#pragma mark - ----------   Lifecycle（生命周期） ----------


#pragma mark - ---------- Private Methods（私有方法） ----------
#pragma mark config control（布局控件）
- (void) safeAreaInsetsDidChange
{
    [super safeAreaInsetsDidChange];
    if(self.oldSafeAreaInsets.left != self.safeAreaInsets.left ||
       self.oldSafeAreaInsets.right != self.safeAreaInsets.right ||
       self.oldSafeAreaInsets.top != self.safeAreaInsets.top ||
       self.oldSafeAreaInsets.bottom != self.safeAreaInsets.bottom)
    {
        self.oldSafeAreaInsets = self.safeAreaInsets;
        [self invalidateIntrinsicContentSize];
        [self.superview setNeedsLayout];
        [self.superview layoutSubviews];
    }
    
}

- (CGSize) sizeThatFits:(CGSize) size
{
    CGSize s = [super sizeThatFits:size];
    if(@available(iOS 11.0, *))
    {
        CGFloat bottomInset = self.safeAreaInsets.bottom;
        if( bottomInset > 0 && s.height < 50) {
            s.height += bottomInset;
        }
    }
    return s;
}


#pragma mark - ---------- Public Methods（公有方法） ----------
#pragma mark setter （重写set方法）



@end
