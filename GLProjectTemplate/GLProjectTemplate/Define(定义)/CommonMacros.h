//
//  CommonMacros.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/23.
//  Copyright © 2017年 GL. All rights reserved.
//

#ifndef CommonMacros_h
#define CommonMacros_h

//全局标记字符串，用于 通知 存储
#pragma mark - ——————— 用户相关 ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"

#pragma mark - ——————— 网络状态相关 ————————
//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"


#define KSuccessCode  [blockResponseObject[@"code"] isEqualToString:@"00"]

//static NSString *const KNotificationCustomerCallAddressCallback = @"KNotificationCustomerCallAddressCallback";


#endif /* CommonMacros_h */
