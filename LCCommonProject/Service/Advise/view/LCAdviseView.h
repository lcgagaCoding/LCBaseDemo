//
//  LCAdviseView.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdviseModel.h"
#import "LCAppConfig.h"

@interface LCAdviseView : UIView

/** 倒计时（默认3秒） */
@property (nonatomic,assign) NSUInteger showTime;

/** 初始化方法*/
- (instancetype)initWithFrame:(CGRect)frame adviseModel:(AdviseModel *)model clickImg:(void(^)(NSString *clikImgUrl))block dismisBlock:(void (^)(void))dismisBlock;

/** 显示广告页面方法*/
- (void)show;

@end
