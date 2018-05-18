//
//  UIDevice+GLHardware.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/5/18.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (GLHardware)

+ (NSString *)gl_platform;
+ (NSString *)gl_platformString;


+ (NSString *)gl_macAddress;

//CPU频率
+ (NSUInteger)gl_cpuFrequency;
//总线
+ (NSUInteger)gl_busFrequency;
//RAM大小
+ (NSUInteger)gl_ramSize;
//CPU数量
+ (NSUInteger)gl_cpuNumber;

/// 获取iOS系统的版本号
+ (NSString *)gl_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)gl_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)gl_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)gl_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)gl_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)gl_totalDiskSpaceBytes;

@end
