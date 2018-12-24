//
//  NSString+Regular.h
//  WuchangPortal
//
//  Created by 郭磊 on 2017/11/28.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

///手机号正则判断
- (BOOL)isMobileNumber;

///验证纯数字
- (BOOL)checkJustNumber;

/*
 校验身份证号码
 */
- (BOOL)validateIDCardNumber;

/*
 身份证粗验证
 */
- (BOOL)judgeIdentityStringValid;

@end
