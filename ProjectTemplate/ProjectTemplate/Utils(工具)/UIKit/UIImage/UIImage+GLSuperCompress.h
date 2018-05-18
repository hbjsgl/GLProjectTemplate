//
//  UIImage+GLSuperCompress.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/5/18.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GLSuperCompress)

/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)gl_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)gl_resizeImage:(UIImage *)image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)gl_scaleImage:(UIImage *)image withLength:(CGFloat) imageLength;


+ (UIImage *)gl_resizableHalfImage:(NSString *)name;

@end
