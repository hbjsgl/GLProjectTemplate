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

#define KSpace15 15.0f

#define KSpace20 20.0f


#pragma mark ————— 字体区 —————

#define FFont10 [UIFont systemFontOfSize:10.0f]
#define FFont12 [UIFont systemFontOfSize:12.0f]
#define FFont14 [UIFont systemFontOfSize:14.0f]
#define FFont16 [UIFont systemFontOfSize:16.0f]

#pragma mark ————— 颜色区 —————

#define kHexColor(hex)        [UIColor colorWithHexString:hex]
//导航title颜色
#define KNavBgFontColor  [UIColor colorWithHexString:@"ffffff"]
//导航背景色
#define KNavBgColor  [UIColor colorWithHexString:@"00AE68"]



#endif /* FontAndColorMacros_h */
