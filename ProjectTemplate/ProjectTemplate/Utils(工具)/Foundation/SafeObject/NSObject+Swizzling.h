//
//  NSObject+Swizzling.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2018/8/6.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
                           originalSelector:(SEL)originalSelector
                           swizzledSelector:(SEL)swizzledSelector;

@end
