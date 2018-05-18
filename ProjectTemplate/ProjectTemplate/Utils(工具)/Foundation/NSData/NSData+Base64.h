//
//  NSData+Base64.h
//  美亚汇投
//
//  Created by gl on 16/10/31.
//  Copyright © 2016年 郭磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

///传入字符串base64后的data返回
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

///data转为字符串 长度
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

///base64 字符串
- (NSString *)base64EncodedString;


@end
