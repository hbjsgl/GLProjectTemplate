//
//  UIButton+GLImagePosition.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/5/18.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GLImagePosition) {
    GLImagePositionLeft = 0,              //图片在左，文字在右，默认
    GLImagePositionRight = 1,             //图片在右，文字在左
    GLImagePositionTop = 2,               //图片在上，文字在下
    GLImagePositionBottom = 3,            //图片在下，文字在上
};

///用button的titleEdgeInsets和 imageEdgeInsets属性来实现button文字图片上下或者左右排列的
@interface UIButton (GLImagePosition)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)gl_setImagePosition:(GLImagePosition)postion spacing:(CGFloat)spacing;

@end
