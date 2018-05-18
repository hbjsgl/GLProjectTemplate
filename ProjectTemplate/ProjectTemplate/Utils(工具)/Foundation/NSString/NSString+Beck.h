//
//  NSString+Beck.h
//  RenaiEdu
//
//  Created by mycomputer on 17/6/6.
//  Copyright © 2017年 郭磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Beck)

+(NSString *)Charactor:(NSString *)aString getFirstCharactor:(BOOL)isGetFirst;

+(BOOL)isZimuWithstring:(NSString *)string;

- (CGSize)fitSizeWithFont:(UIFont *)font;

- (CGSize)fitSizeToLabelWithFont:(UIFont *)font labelSize:(CGSize)size options:(NSStringDrawingOptions)drawingOptions;

//1.0 根据当前label的字体和文本计算需要最小宽度
- (CGFloat)fitWidthWithFont:(UIFont *)font;

//1.1 根据当前label的字体和文本计算需要最小高度
- (CGFloat)fitHeightWithFont:(UIFont *)font;

// 播放器时间转换
+ (NSString *)convertTime:(CGFloat)second;

/*
 *  秒 转换为 00 : 00 : 00
 */
+ (NSString *)videoTimeChangeStr:(NSInteger)second;

/** 距离现在的时间 (yyyy-MM-dd HH:mm:ss.S) */
- (NSString *)BeoforeNow;

/** 时间戳处理 距离现在的时间 (yyyy-MM-dd HH:mm:ss) */
- (NSString *)timeBeoforeNow;

/** 表情符号的判断*/
+ (BOOL)stringContainsEmoji:(NSString *)string;

/*
 *  判断字符串是否为空
 */
+  (BOOL)isBlankString:(NSString *)string;


@end
