//
//  BaseNavigationViewController.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//Copyright © 2017年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 导航控制器基类
 */
@interface BaseNavigationViewController : UINavigationController

/*!
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
-(BOOL)popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated;

@end
