//
//  UIButton+AddBlock.m
//  ProjectTemplate
//
//  Created by 郭磊 on 2017/12/19.
//  Copyright © 2017年 guolei. All rights reserved.
//

#import "UIButton+AddBlock.h"

@implementation UIButton (AddBlock)

-(void)setBlock:(void(^)(UIButton*))block {
    
    objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}

-(void(^)(UIButton*))block {
    
    return objc_getAssociatedObject(self,@selector(block));
    
}

-(void)addTapBlock:(void(^)(UIButton*))block {
    
    self.block= block;
    
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)click:(UIButton*)btn {
    
    if(self.block) {
        
        self.block(btn);
        
    }
    
}

@end
