//
//  UIButton+LCCreate.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "UIButton+LCCreate.h"

@implementation UIButton (LCCreate)

+ (UIButton *)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action{
    
    return [self customWithFrame:frame title:title titleColor:titleColor fontSize:fontSize bgImage:bgImage image:nil target:target action:action];
    
}
+ (UIButton *)customWithFrame:(CGRect)frame
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action{
    
    
    return [self customWithFrame:frame title:nil titleColor:nil fontSize:0 bgImage:nil image:image target:target action:action];
}

+ (UIButton *)customWithFrame:(CGRect)frame
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action{
    
    
    return [self customWithFrame:frame title:nil titleColor:nil fontSize:0 bgImage:nil image:bgImage target:target action:action];
}



+ (UIButton *)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                      bgImage:(NSString *)bgImage
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (title) [button setTitle:title forState:UIControlStateNormal];
    if (titleColor) [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (fontSize) button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    if (bgImage)  [button setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
    if (image)  [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}



@end
