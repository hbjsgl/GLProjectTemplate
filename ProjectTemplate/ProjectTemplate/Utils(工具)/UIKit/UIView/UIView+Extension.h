//
//  UIView+Extension.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/25.
//  Copyright © 2017年 GL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/** 展示主窗口 */
- (BOOL)isShowingOnKeyWindow;

/**
 左底部
 */
@property (readonly)CGPoint bottomLeft;
/**
 右底部
 */
@property (readonly)CGPoint bottomRight;
/**
 右顶部
 */
@property (readonly)CGPoint topRight;

/**
 移动
 
 @param delta 参数
 */
- (void)moveBy:(CGPoint)delta;

@end
