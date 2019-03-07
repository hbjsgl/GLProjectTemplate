//
//  AppDelegate+AppService.h
//  GLProjectTemplate
//
//  Created by 郭磊 on 2019/3/7.
//  Copyright © 2019 郭磊. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

#define ReplaceRootViewController(vc) [[AppDelegate shareAppDelegate] replaceRootViewController:vc]

/**
 第三方 和 应用业务的实现，减少入口处代码量
 */
@interface AppDelegate (AppService)

@end

NS_ASSUME_NONNULL_END
