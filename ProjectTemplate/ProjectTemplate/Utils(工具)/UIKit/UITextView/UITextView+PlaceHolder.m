//
//  UITextView+PlaceHolder.m
//  PropertyForOwner
//
//  Created by 郭磊 on 2018/5/17.
//  Copyright © 2018年 guolei. All rights reserved.
//

#import "UITextView+PlaceHolder.h"
#import <objc/runtime.h>

static const char *gl_placeHolderTextView = "gl_placeHolderTextView";

@implementation UITextView (PlaceHolder)

- (UITextView *)gl_placeHolderTextView {
    
    return objc_getAssociatedObject(self, gl_placeHolderTextView);
}

- (void)setGl_placeHolderTextView:(UITextView *)placeHolderTextView {
    
    objc_setAssociatedObject(self, gl_placeHolderTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)gl_addPlaceHolder:(NSString *)placeHolder {
    
    if (![self gl_placeHolderTextView]) {
        
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setGl_placeHolderTextView:textView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    }
    
    self.gl_placeHolderTextView.text = placeHolder;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    self.gl_placeHolderTextView.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)noti {
    if (self.text && [self.text isEqualToString:@""]) {
        self.gl_placeHolderTextView.hidden = NO;
    }
}

+ (void)load {
    
    [super load];
    
    Method origMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method newMethod = class_getInstanceMethod([self class], @selector(jk_textView_placeholder_swizzledDealloc));
    method_exchangeImplementations(origMethod, newMethod);
}

- (void)jk_textView_placeholder_swizzledDealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self jk_textView_placeholder_swizzledDealloc];
}


@end
