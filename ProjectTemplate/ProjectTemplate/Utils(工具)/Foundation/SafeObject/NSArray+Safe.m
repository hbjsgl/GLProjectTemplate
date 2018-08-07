//
//  NSArray+Safe.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "NSArray+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"

@implementation NSArray (Safe)

+ (void)load {

#if DEBUG

#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //替换objectAtIndex
        NSString *tmpStr = @"objectAtIndex:";
        NSString *tmpFirstStr = @"safe_ZeroObjectAtIndex:";
        NSString *tmpSecondStr = @"safe_singleObjectAtIndex:";
        NSString *tmpThreeStr = @"safe_objectAtIndex:";
        
        //替换objectAtIndexedSubscript
        NSString *tmpSubScriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSecondSubscriptStr = @"safe_objectAtIndexedSubscript:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArray0")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpFirstStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSSingleObjectArrayI")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpSecondStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                     originalSelector:NSSelectorFromString(tmpStr)
                                     swizzledSelector:NSSelectorFromString(tmpThreeStr)];
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayI")
                                     originalSelector:NSSelectorFromString(tmpSubScriptStr)
                                     swizzledSelector:NSSelectorFromString(tmpSecondSubscriptStr)];
        
    });
#endif
}


/**
 取出arr 第index值，对应__NSArrayI

 @param index 索引
 @return 返回值
 */
- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

/**
 取出arr 第index值，对应__NSSingleObjectArrayI

 @param index 索引
 @return 返回值
 */
- (id)safe_singleObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        
        return nil;
    }
    return [self safe_singleObjectAtIndex:index];
}

/**
 取出arr 第index值，对应__NSArray0
 
 @param index 索引
 @return 返回值
 */
- (id)safe_ZeroObjectAtIndex:(NSUInteger)index {
    
    if (index >= self.count) {
        
        return nil;
    }
    return [self safe_ZeroObjectAtIndex:index];
}

/**
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param index 索引 idx
 @return 返回值
 */
- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}


@end
