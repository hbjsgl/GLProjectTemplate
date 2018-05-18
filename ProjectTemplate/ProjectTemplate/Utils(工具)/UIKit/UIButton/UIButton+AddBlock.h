//
//  UIButton+AddBlock.h
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AddBlock)

@property(nonatomic ,copy)void(^block)(UIButton *);

-(void)addTapBlock:(void(^)(UIButton *btn))block;

@end
