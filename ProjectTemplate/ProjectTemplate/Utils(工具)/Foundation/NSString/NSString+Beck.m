//
//  NSString+Beck.m
//  RenaiEdu
//
//  Created by mycomputer on 17/6/6.
//  Copyright © 2017年 郭磊. All rights reserved.
//

#import "NSString+Beck.h"

@implementation NSString (Beck)

+(NSString *)Charactor:(NSString *)aString getFirstCharactor:(BOOL)isGetFirst {
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinYin = [str capitalizedString];
    //转化为大写拼音
    if(isGetFirst) {
        //获取并返回首字母
        return [pinYin substringToIndex:1];
    }
    else {
        return pinYin;
    }
}

+(BOOL)isZimuWithstring:(NSString *)string {
    NSString* number=@"^[A-Za-z]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return  [numberPre evaluateWithObject:string];
}


//1.1 根据当前label的字体和文本计算需要最小高度
- (CGSize)fitSizeWithFont:(UIFont *)font {
    return [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
}
//1.0 根据当前label的字体和文本计算需要最小宽度
- (CGFloat)fitWidthWithFont:(UIFont *)font{
    CGSize size = [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    return size.width + 1;
}

//1.1 根据当前label的字体和文本计算需要最小高度
- (CGFloat)fitHeightWithFont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    return size.height;
}
// 
- (CGSize)fitSizeToLabelWithFont:(UIFont *)font labelSize:(CGSize)size options:(NSStringDrawingOptions)drawingOptions {
    return [self boundingRectWithSize:size options:drawingOptions attributes:@{NSFontAttributeName:font} context:nil].size;
}

+ (NSString *)convertTime:(CGFloat)second {
    // 相对格林时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    if (second / 3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    
    NSString *showTimeNew = [formatter stringFromDate:date];
    return showTimeNew;
}

+ (NSString *)videoTimeChangeStr:(NSInteger)second {
    NSInteger seconds = second % 60;
    NSInteger minutes = (second / 60) % 60;
    NSInteger hours = second / 3600;
    
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)hours, (long)minutes, (long)seconds];
}

- (NSString *)returndate:(NSNumber *)num {
    
    NSString *str1 = [NSString stringWithFormat:@"%@",num];
    
    int x = [[str1 substringToIndex:10] intValue];
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:x];
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"HH:mm:ss"];
    
    return [dateformatter stringFromDate:date1];
}

- (NSString *)BeoforeNow {
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate = [inputFormatter dateFromString:self];
    //    NSLog(@"date = %@", inputDate);
    NSTimeInterval interval = [inputDate timeIntervalSinceNow];
    long as=(long)interval*(-1);
    if (as<0) {
        return @"";
    }
    if (as==0) {
        return @"刚刚";
    }
    if (as<60){
        return [NSString stringWithFormat:@"%lu秒前",as];
    }
    if (as<3600){
        long bs=as/60;
        return [NSString stringWithFormat:@"%lu分钟前",bs];
    }
    if (as<86400){
        long bs=as/3600;
        return [NSString stringWithFormat:@"%lu小时前",bs];
    }
    if (as<2592000){
        long bs=as/86400;
        return [NSString stringWithFormat:@"%lu天前",bs];
    }
    if (as<31536000){
        long bs=as/2592000;
        return [NSString stringWithFormat:@"%lu月前",bs];
    }
    
    long bs=as/31536000;
    return [NSString stringWithFormat:@"%lu年前",bs];
}

- (NSString *)timeBeoforeNow {
    
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] * 1000;
    NSTimeInterval interval2 = [self doubleValue] - interval;
    long as = (long)interval2*(-1)/1000;
    if (as<0) {
        return @"";
    }
    if (as < 10) {
        return @"刚刚";
    }
    if (as < 60){
        return [NSString stringWithFormat:@"%lu秒前",as];
    }
    if (as<3600){
        //1小时内
        long bs=as/60;
        return [NSString stringWithFormat:@"%lu分钟前",bs];
    }
    if (as<3600*24){
        //24小时内
        long bs=as/3600;
        return [NSString stringWithFormat:@"%lu小时前",bs];
    }
    if (as<86400*7){
        //一个星期内
        long bs=as/86400;
        return [NSString stringWithFormat:@"%lu天前",bs];
    }
    //    if (as<31536000){
    //        long bs=as/2592000;
    //        return [NSString stringWithFormat:@"%lu月前",bs];
    //    }
    
    //    long bs=as/31536000;
    //    return [NSString stringWithFormat:@"%lu年前",bs];
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"en_US"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (BOOL)isBlankString:(NSString *)string {
    
    if (string == nil || string == NULL) {
    
         return YES;
    
     }

    if ([string isKindOfClass:[NSNull class]]) {
    
        return YES;
    }

     if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
     
        return YES;
     }

     return NO;
    
}
//表情符号的判断
+ (BOOL)stringContainsEmoji:(NSString *)string {
    
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

@end
