//
//  UIColor+GLWeb.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/5/18.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GLWeb)

/**
 *  @brief  获取canvas用的颜色字符串
 *
 *  @return canvas颜色
 */
- (NSString *)gl_canvasColorString;

/**
 *  @brief  获取网页颜色字串
 *
 *  @return 网页颜色
 */
- (NSString *)gl_webColorString;

@end
