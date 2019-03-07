//
//  URLMacros.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/23.
//  Copyright © 2017年 GL. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h

#import <Foundation/Foundation.h>


//内部版本号 每次发版递增
#define KVersionCode 1
/*
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever    1
#define TestSever       0
#define ProductSever    0

#if DevelopSever
/**开发服务器*/
static NSString *const URL_main = @"http://192.168.0.65:8099";


#elif TestSever
/**测试服务器*/
static NSString *const URL_main = @"http://";

#elif ProductSever
/**生产服务器*/
static NSString *const URL_main = @"http://";
#endif


#pragma mark ————— 详细接口地址 —————

//-------------------文件-------------------

///文件上传
//static NSString *const UploadFileApi = @"/app/volice/upload";


#endif /* URLMacros_h */
