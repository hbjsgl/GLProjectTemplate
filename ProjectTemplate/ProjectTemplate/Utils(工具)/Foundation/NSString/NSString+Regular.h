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
- (BOOL)isMobileNumber:(NSString *)phoneNumber;

@end
