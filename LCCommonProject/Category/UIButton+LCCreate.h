//
//  UIButton+LCCreate.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LCCreate)

+ (UIButton *)customWithFrame:(CGRect)frame
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action;

+ (UIButton *)customWithFrame:(CGRect)frame
                        image:(NSString *)image
                       target:(id)target
                       action:(SEL)action;

+ (UIButton *)customWithFrame:(CGRect)frame
                      bgImage:(NSString *)bgImage
                       target:(id)target
                       action:(SEL)action;
@end
