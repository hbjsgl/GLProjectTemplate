//
//  FontAndColorMacros.h
//  GraceLiveCat
//
//  Created by 郭磊 on 2017/10/23.
//  Copyright © 2017年 GL. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

//字体大小和颜色配置


#pragma mark ————— 间距区 —————

#define KNormalSpace8 8.0f

#define KSpace10 10.0f

#define KSpace16 16.0f

#define KSpace15 15.0f

#define KSpace20 20.0f

#pragma mark ————— 字体区 —————

#define FFont10 [UIFont fit_configure:10.0f]
#define FFont12 [UIFont fit_configure:12.0f]
#define FFont14 [UIFont fit_configure:14.0f]
#define FFont16 [UIFont fit_configure:16.0f]

//字体
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define KSYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#pragma mark ————— 颜色区 —————

#define kHexColor(hex)        [UIColor colorWithHexString:hex]
//导航title颜色
#define KNavBgFontColor  [UIColor colorWithHexString:@"ffffff"]
//导航背景色
#define KNavBgColor  [UIColor colorWithHexString:@"c9a263"]
//线条边框灰色
#define KLineColor  [UIColor colorWithHexString:@"eeeeee"]
//app主体颜色
#define KMainColor  [UIColor colorWithHexString:@"eeeeee"]

//颜色
#define KClearColor [UIColor clearColor]
#define KWhiteColor [UIColor whiteColor]
#define KBlackColor [UIColor blackColor]
#define KGrayColor [UIColor grayColor]
#define KGray2Color [UIColor lightGrayColor]
#define KBlueColor [UIColor blueColor]
#define KRedColor [UIColor redColor]

#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成


#endif /* FontAndColorMacros_h */
