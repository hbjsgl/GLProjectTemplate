//
//  UIButton+Touch.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/9/3.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define defaultInterval 0.5 //默认时间间隔

@interface UIButton (Touch)

///设置点击时间间隔
@property (nonatomic, assign)NSTimeInterval timeInterval;

///是否取消
@property (nonatomic, assign)BOOL isIgnore;

@end
