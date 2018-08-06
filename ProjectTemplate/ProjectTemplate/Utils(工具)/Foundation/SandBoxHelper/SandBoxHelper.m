//
//  SandBoxHelper.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "SandBoxHelper.h"

@implementation SandBoxHelper

+ (NSString *)homePath {
    return NSHomeDirectory();
}

+ (NSString *)appPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)docPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)libPrefPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingString:@"/Preferences"];
}

+ (NSString *)libCachePath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingString:@"/Caches"];
}

+ (NSString *)temPath {
    
    return [NSHomeDirectory() stringByAppendingString:@"/tmp"];
}

+ (NSString *)iapReceiptPath {
    
    NSString *path = [[self libPrefPath] stringByAppendingString:@"/EACEF35FE363A75A"];
    [self hasLive:path];
    return path;
}

+ (BOOL)hasLive:(NSString *)path {
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        
        return [[NSFileManager defaultManager] createDirectoryAtPath:path
                                         withIntermediateDirectories:YES
                                                          attributes:nil
                                                               error:NULL];
    }
    
    return YES;
}

@end
