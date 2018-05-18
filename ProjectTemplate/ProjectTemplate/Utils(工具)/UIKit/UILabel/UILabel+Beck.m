//
//  UILabel+Beck.m
//  RenaiEdu
//
//  Created by mycomputer on 17/6/8.
//  Copyright © 2017年 郭磊. All rights reserved.
//

#import "UILabel+Beck.h"

@implementation UILabel (Beck)

+ (instancetype)labelWithPoint:(CGPoint)point textColor:(UIColor *)color font:(UIFont *)font text:(NSString *)title type:(BeckLabelStyle)type {
    UILabel *beckLabel = [[self alloc] init];
    beckLabel.textColor = color;
    beckLabel.font = font;
    NSDictionary *attribtDic;
    switch (type) {
        case BeckLabelStyleNeedUnderline:{
            // 添加下划线
            attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        }
            break;
        case BeckLabelStyleNeedMidline: {
            //中划线
            attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        }
        default:
            break;
    }
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attribtDic];
    beckLabel.attributedText = attribtStr;
    
    // 内部计算出label  size 并且赋值 frame
    beckLabel.size = beckLabel.fitSize;
    beckLabel.center =  point;
    
    return beckLabel;
}

+ (UILabel *(^)(CGPoint point, UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))setupLineToLabel {
    return ^(CGPoint point, UIColor *color, UIFont *font, NSString *title , BeckLabelStyle type) {
        // 基本赋值
        UILabel *beckLabel = [[self alloc] init];
        beckLabel.textColor = color;
        beckLabel.font = font;
        NSDictionary *attribtDic;
        
        // 通过枚举布局样式
        switch (type) {
            case BeckLabelStyleNeedUnderline:{
                // 添加下划线
                attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                break;
            case BeckLabelStyleNeedMidline: {
                //中划线
                attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                // 待扩展其他
            default:
                break;
        }
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attribtDic];
        beckLabel.attributedText = attribtStr;
        
        // 内部计算出label  size 并且赋值 frame
        beckLabel.size = beckLabel.fitSize;
        beckLabel.center =  point;
        
        return beckLabel;
    };
}

+ (UILabel *(^)(UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))setupLabel {
    return ^(UIColor *color, UIFont *font, NSString *title , BeckLabelStyle type) {
        // 基本赋值
        UILabel *beckLabel = [[self alloc] init];
        beckLabel.textColor = color;
        beckLabel.font = font;
        NSDictionary *attribtDic;
        
        // 通过枚举布局样式
        switch (type) {
            case BeckLabelStyleNeedUnderline:{
                // 添加下划线
                attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                break;
            case BeckLabelStyleNeedMidline: {
                //中划线
                attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                // 待扩展其他
            default:
                break;
        }
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:title attributes:attribtDic];
        beckLabel.attributedText = attribtStr;
        // 内部计算出label  size 并且赋值 frame
        beckLabel.size = beckLabel.fitSize;
        return beckLabel;
    };
}
-(UILabel *(^)(NSString *, BeckLabelStyle))setAttribtStr {
    return ^(NSString *title,BeckLabelStyle type){
        NSDictionary *attribtDic;
        // 通过枚举布局样式
        switch (type) {
            case BeckLabelStyleNeedUnderline:{
                // 添加下划线
                attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                break;
            case BeckLabelStyleNeedMidline: {
                //中划线
                attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            }
                // 待扩展其他
            default:
                break;
        }
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:title attributes:attribtDic];
        self.attributedText = attribtStr;
        // 内部计算出label  size 并且赋值 frame
        self.size = self.fitSize;

        return self;
    };
}
/**设置字体颜色*/
-(UILabel *(^)(UIColor *))setColor {
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
/**设置字体大小*/
- (UILabel *(^)(UIFont *font))setFont {
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}
/**设置文字*/
- (UILabel *(^)(NSString *text))setText {
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}
/**设置xy坐标*/
- (UILabel *(^)(CGPoint point))setPoint {
    return ^(CGPoint point){
        self.center =  point;
        return self;
    };
}

//1.1 根据当前label的字体和文本计算需要最小高度
- (CGSize)fitSize {
    return CGSizeMake([self fitWidth], [self fitHeight]);
}
//1.0 根据当前label的字体和文本计算需要最小宽度
- (CGFloat)fitWidth {
    CGSize size = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil]];
    return size.width + 1;
}

//1.1 根据当前label的字体和文本计算需要最小高度
- (CGFloat)fitHeight {
    CGSize size = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil]];
    return size.height;
}

-(BOOL)moreColorFont:(NSArray *)array{
    if(array.count % 3 != 0){
        return NO;
    }
    for (int i=0; i<array.count; i++) {
        if (i%3==0) {
            if (![array[i] isKindOfClass:[NSString class]]) {
                return NO;
            }else{
                
            }
        } else if (i%3==1) {
            if (![array[i] isKindOfClass:[UIColor class]]) {
                return NO;
            }else{
                
            }
        }else{
            if (![array[i] isKindOfClass:[NSNumber class]]) {
                return NO;
            }else{
                
            }
        }
    }
    NSMutableAttributedString *mutAttribute;
    for (int i=0; i<array.count/3; i++) {
        if (i==0) {
            UIColor *color=array[1];
            CGFloat size=[array[2] doubleValue];
            NSString *str=array[0];
            NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:size]};
            
            mutAttribute = [[NSMutableAttributedString alloc]initWithString:str attributes:attributes];
        }else{
            UIColor *color=array[i*3+1];
            CGFloat size=[array[i*3+2] doubleValue];
            NSString *str=array[i*3];
            NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:size]};
            
            [mutAttribute appendAttributedString:[[NSAttributedString alloc]initWithString:str attributes:attributes]];
        }
    }
    self.attributedText = mutAttribute;
    return YES;
}


/**
 要么不写，要么执行
 */
+ (UILabel *(^)(NSRange range, UIColor *color, UIFont *font,NSString *title,BeckLabelStyle type))AttributedStringText {

    return nil;
}

-(void)speColorText:(NSString *)str AndCocor:(UIColor *)color AndFont:(UIFont *)Font {
    if (!str) {
        return;
    }
    if (str.length < 1) {
        return;
    }
    NSArray  *array = [self.text componentsSeparatedByString:str];
    NSLog(@"%@",array);
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName:color,NSFontAttributeName:Font};
    
    NSAttributedString *midStr = [[NSAttributedString alloc]initWithString:str attributes:attributes];
    
    NSMutableAttributedString *mutAttribute = [[NSMutableAttributedString alloc]initWithString:array[0]];
    if (array.count == 1) {
        
    }else {
        for (int i = 1; i < array.count; i++) {
            [mutAttribute appendAttributedString:midStr];
            [mutAttribute appendAttributedString:[[NSAttributedString alloc]initWithString:array[i]]];
        }
    }
    self.attributedText = mutAttribute;
}
@end
