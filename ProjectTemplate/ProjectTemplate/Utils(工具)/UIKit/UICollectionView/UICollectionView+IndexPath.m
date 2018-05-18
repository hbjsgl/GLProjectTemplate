//
//  UICollectionView+IndexPath.m
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/24.
//  Copyright © 2017年 GL. All rights reserved.
//

#import "UICollectionView+IndexPath.h"
#import <objc/runtime.h>


@implementation UICollectionView (IndexPath)

static NSString * const KIndexPathKey = @"kIndexPathKey";


-(void)setCurrentIndexPath:(NSIndexPath *)indexPath
{
    //通过此函数保存indexPath
    objc_setAssociatedObject(self, &KIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)currentIndexPath
{
    NSIndexPath * indexPath = objc_getAssociatedObject(self, &KIndexPathKey);
    return indexPath;
}

@end
