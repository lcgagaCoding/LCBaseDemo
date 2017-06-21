//
//  LCBaseViewController.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/23.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCHttpEngineTool.h"

static NSString *kCannotBackNotification = @"kCannotBackNotification";//部分页面不能返回的通知

@interface LCBaseViewController : UIViewController

@property (strong, nonatomic) UIImageView *lineImageView;//导航栏线条

@property (strong, nonatomic) LCHttpBaseEngine *clientEngine;


- (void)backClick:(UIButton *)button;

- (void)initData;

- (void)initView;

- (void)loadData;

@end
