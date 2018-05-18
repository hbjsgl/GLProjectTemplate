//
//  UILabel+Beck.h
//  RenaiEdu
//
//  Created by mycomputer on 17/6/8.
//  Copyright © 2017年 郭磊. All rights reserved.
//

#import <UIKit/UIKit.h>

// 点读的单元课本的状态
typedef NS_ENUM(NSUInteger, BeckLabelStyle) {
    BeckLabelStyleDefault       = 0,  // 默认不添加
    BeckLabelStyleNeedUnderline = 1,  // 添加下划线
    BeckLabelStyleNeedMidline   = 2   // 添加中划线
};

@interface UILabel (Beck)

/**给label 添加下划线 中话划线*/
+ (instancetype)labelWithPoint:(CGPoint)point textColor:(UIColor *)color font:(UIFont *)font text:(NSString *)title type:(BeckLabelStyle)type;
/**链式*/
+ (UILabel *(^)(CGPoint point, UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))setupLineToLabel;

+ (UILabel *(^)(UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))setupLabel;
/**设置字体颜色*/
- (UILabel *(^)(UIColor *color))setColor;
/**设置字体大小*/
- (UILabel *(^)(UIFont *font))setFont;
/**设置文字*/
- (UILabel *(^)(NSString *text))setText;
/**设置xy坐标*/
- (UILabel *(^)(CGPoint point))setPoint;
/**文字*/
- (UILabel *(^)(NSString *attribtStr,BeckLabelStyle))setAttribtStr;


//1.1 根据当前label的字体和文本计算需要最小高度
- (CGSize)fitSize;

//1.0 根据当前label的字体和文本计算需要最小宽度
- (CGFloat)fitWidth;

//1.1 根据当前label的字体和文本计算需要最小高度
- (CGFloat)fitHeight;


+ (UILabel *(^)(NSRange range, UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))AttributedStringText;

-(BOOL)moreColorFont:(NSArray *)array;

-(void)speColorText:(NSString *)str AndCocor:(UIColor *)color AndFont:(UIFont *)Font;
@end
