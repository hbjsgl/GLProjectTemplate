//
//  UITextView+PlaceHolder.h
//  PropertyForOwner
//
//  Created by 郭磊 on 2018/5/17.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (PlaceHolder)<UITextViewDelegate>

@property (nonatomic, strong) UITextView *gl_placeHolderTextView;
- (void)gl_addPlaceHolder:(NSString *)placeHolder;

@end
