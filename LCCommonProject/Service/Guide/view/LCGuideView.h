//
//  LCGuideView.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickIndexBlock)(NSInteger index);

@interface LCGuideView : UIView

/** 初始化方法*/
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images btnImages:(NSArray<NSString *> *)btnImages clickBlock:(ClickIndexBlock)clickBlock;

/** 显示广告页面方法*/
- (void)show;


@end
