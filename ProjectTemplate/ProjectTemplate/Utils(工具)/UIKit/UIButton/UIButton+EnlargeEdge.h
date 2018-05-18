//
//  UIButton+EnlargeEdge.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

///扩大按钮的响应范围
@interface UIButton (EnlargeEdge)

///扩大按钮的响应范围
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
