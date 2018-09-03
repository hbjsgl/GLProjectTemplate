//
//  UIButton+Extension.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/25.
//  Copyright © 2017年 GL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/** 点击状态栏返回顶部 */
+ (void)show;
+ (void)hide;

@property (strong, nonatomic) UIColor *titleColor;
@property (strong, nonatomic) UIColor *highlightedTitleColor;
@property (strong, nonatomic) UIColor *selectedTitleColor;

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *highlightedTitle;
@property (copy, nonatomic) NSString *selectedTitle;

@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *highlightedImage;
@property (copy, nonatomic) NSString *selectedImage;

@property (copy, nonatomic) NSString *bgImage;
@property (copy, nonatomic) NSString *highlightedBgImage;
@property (copy, nonatomic) NSString *selectedBgImage;

/**用来保存数据模型 方便传值的时候使用*/
@property (strong ,nonatomic) NSObject *modelObj;

- (void)addTarget:(id)target action:(SEL)action;

/**图片文字上下居中*/
- (void)setButtonContentCenter;

@end
