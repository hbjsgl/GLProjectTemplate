//
//  UserDefaultsManager.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/12/24.
//  Copyright © 2018 guolei. All rights reserved.
//

#import "UserDefaultsManager.h"

static NSString * const UserDefaultsUserNam = @"userName";


#define sandBoxDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define sandBoxTemp NSTemporaryDirectory()

@implementation UserDefaultsManager


#pragma mark - ------------save方法--------------
+ (void)saveUserName:(NSString *)userName {
    
    [self saveData:UserDefaultsUserNam andValue:userName];
}

#pragma mark - ------------get方法--------------
+ (NSString *)getUserNam {
    return [self getData:UserDefaultsUserNam];
}


#pragma mark - ------------操作方法--------------
/**
 取值操作
 
 @param key key
 @return 值
 */
+ (id)getData:(NSString *)key {
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *val = nil;
    
    if (standardUserDefaults)
        val = [standardUserDefaults objectForKey:key];
    
    // 为nil为空 默认空字符串
    if ((!val)) {
        
        val = @"";
    }
    
    return val;
}


/**
 保存操作
 
 @param key key
 @param value value
 @return .
 */
+ (BOOL)saveData:(NSString *)key andValue:(id)value {
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    BOOL bResult = NO;
    if (standardUserDefaults) {
        [standardUserDefaults setObject:value forKey:key];
        [standardUserDefaults synchronize];
        bResult = YES;
    }
    return bResult;
}

//清除所有信息
+ (void)clearUserMessage {
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSDictionary *dictionary=[userDefaults dictionaryRepresentation];
    for (NSString *key in [dictionary allKeys]) {
        
        if (![key isEqualToString:@"baseId"]) {
            
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
        }
    }
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSArray *documentPaths = [fileManager contentsOfDirectoryAtPath:sandBoxDocument error:nil];
    NSArray *tempPaths = [fileManager contentsOfDirectoryAtPath:sandBoxTemp error:nil];
    for (NSString *document in documentPaths) {
        NSString *path = [sandBoxDocument stringByAppendingPathComponent:document];
        [fileManager removeItemAtPath:path error:nil];
    }
    for (NSString *temp in tempPaths) {
        NSString *path = [sandBoxTemp stringByAppendingPathComponent:temp];
        [fileManager removeItemAtPath:path error:nil];
    }
}


@end
