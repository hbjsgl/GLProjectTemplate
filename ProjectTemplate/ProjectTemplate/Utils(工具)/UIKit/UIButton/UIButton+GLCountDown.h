//
//  UIButton+GLCountDown.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/5/18.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (GLCountDown)

-(void)gl_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
