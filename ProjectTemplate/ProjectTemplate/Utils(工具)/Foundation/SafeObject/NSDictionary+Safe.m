//
//  NSDictionary+Safe.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import "NSObject+ImpChangeTool.m"
#import <objc/runtime.h>

@implementation NSDictionary (Safe)

+ (void)load {
    
#if DEBUG
    
#else
    [self SwizzlingMethod:@"initWithObjects:forKeys:count:"
        systemClassString:@"__NSPlaceholderDictionary"
       toSafeMethodString:@"initWithObjects_st:forKeys:count:"
        targetClassString:@"NSDictionary"];
#endif
}

- (instancetype)initWithObjects_st:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    
    NSUInteger rightCont = 0;
    for (NSUInteger i = 0; i < count; i++) {
        
        if (!(keys[i] && objects[i])) {
            
            break;
        }else {
            rightCont++;
        }
    }
    self = [self initWithObjects_st:objects
                            forKeys:keys
                              count:count];
    return self;
}

@end
