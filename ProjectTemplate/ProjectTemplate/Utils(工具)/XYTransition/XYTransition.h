//
//  XYTransition.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/23.
//Copyright © 2017年 GL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign) BOOL isPush;//是否是push，反之则是pop

@property (nonatomic, assign) NSTimeInterval animationDuration;//动画时长

@end
