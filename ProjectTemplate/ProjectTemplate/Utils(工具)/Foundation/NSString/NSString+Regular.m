//
//  NSString+Regular.m
//  WuchangPortal
//
//  Created by 郭磊 on 2017/11/28.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

- (BOOL)isMobileNumber:(NSString *)phoneNumber {
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phoneNumber];
}

@end
