//
//  UIScrollView+Direction.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/26.
//  Copyright © 2017年 GL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GL_ScrollDirection) {
    ScrollDirectionForUp,//向上滑动
    ScrollDirectionForDown,
};
@interface UIScrollView (Direction)

/** 滑动方向区分值*/
@property (nonatomic,assign) CGFloat gl_offsetY;

/** 滑动方向block*/
@property (nonatomic,copy) void (^scrollDirectionBlock)(GL_ScrollDirection direction);

@end
