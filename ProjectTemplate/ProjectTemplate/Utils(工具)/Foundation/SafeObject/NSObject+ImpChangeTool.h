//
//  NSObject+ImpChangeTool.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ImpChangeTool)

/**
 函数指针交换

 @param systemMethodString 系统方法名
 @param systemClassString 系统实现方法类名
 @param safeMethodString 自定义hook方法名
 @param targetClassString 目标实现类名
 */
+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString;

@end
