//
//  UIViewController+AlertViewAndActionSheet.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/24.
//  Copyright © 2017年 GL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NO_USE -1000
typedef void(^click)(NSInteger index);
typedef void(^configuration)(UITextField *field, NSInteger index);
typedef void(^clickHaveField)(NSArray<UITextField *> *fields, NSInteger index);

@interface UIViewController (AlertViewAndActionSheet)

#ifdef kiOS8Later

#else
<
UIAlertViewDelegate,
UIActionSheetDelegate
>
#endif

/**
 alert

 @param title title
 @param message message
 @param others others
 @param animated animated
 @param click click
 */
- (void)AlertWithTitle:(NSString *)title
               message:(NSString *)message
             andOthers:(NSArray<NSString *> *)others
              animated:(BOOL)animated
                action:(click)click;


/**
 actionSheet

 @param title title
 @param message message
 @param destructive destructive
 @param destructiveAction destructiveAction
 @param others others
 @param animated animated
 @param click click
 */
- (void)ActionSheetWithTitle:(NSString *)title
                     message:(NSString *)message
                 destructive:(NSString *)destructive
           destructiveAction:(click )destructiveAction
                   andOthers:(NSArray <NSString *> *)others
                    animated:(BOOL )animated
                      action:(click )click;


/**
 textAlert

 @param title title
 @param message message
 @param buttons buttons
 @param number number
 @param configuration configuration
 @param animated animated
 @param click click
 */
- (void)AlertWithTitle:(NSString *)title
               message:(NSString *)message
               buttons:(NSArray<NSString *> *)buttons
       textFieldNumber:(NSInteger )number
         configuration:(configuration )configuration
              animated:(BOOL )animated
                action:(clickHaveField )click;


@end
