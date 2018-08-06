//
//  SandBoxHelper.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SandBoxHelper : NSObject

/**
 程序主目录，可见子目录(3个):Documents、Library、tmp

 @return 程序主目录
 */
+ (NSString *)homePath;

/**
 程序目录，不能存东西

 @return 程序目录
 */
+ (NSString *)appPath;

/**
 文档目录，ITUNES同步备份的数据存这里，可存放用户数据

 @return 文档目录
 */
+ (NSString *)docPath;

/**
 配置目录，配置文件存放

 @return 配置目录
 */
+ (NSString *)libPrefPath;

/**
 缓存目录，系统永远不会删除这里，iTunes会删掉

 @return 缓存目录
 */
+ (NSString *)libCachePath;

/**
 临时缓存目录,app退出后，系统可能会删除

 @return 临时缓存目录
 */
+ (NSString *)temPath;

/**
 iap购买凭证存放目录

 @return iap购买凭证存放目录
 */
+ (NSString *)iapReceiptPath;

@end
