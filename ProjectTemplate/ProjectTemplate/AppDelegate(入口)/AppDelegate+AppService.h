//
//  AppDelegate+AppService.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import "AppDelegate.h"

#define ReplaceRootViewController(vc) [[AppDelegate shareAppDelegate] replaceRootViewController:vc]

/**
 第三方 和 应用业务的实现，减少入口处代码量
 */
@interface AppDelegate (AppService)

/**
 初始化
 */
- (void)initService;

/**
 初始化窗口
 */
- (void)initWindow;

/**
 初始化用户系统
 */
- (void)initUserManager;

/**
 监听网络状态
 */
- (void)monitorNetworkStatus;

/**
 显示Toast
 */
- (void)showToast:(NSString *)text;

/**
 单例
 
 @return 单例对象
 */
+ (AppDelegate *)shareAppDelegate;

/**
 获取当前顶层控制器
 
 @return 顶层控制器
 */
- (UIViewController *)getCurrentVC;

- (UIViewController *)getCurrentUIVC;

@end
