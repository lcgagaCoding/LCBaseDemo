//
//  LCTabbarService.h
//  LCCommonProject
//
//  Created by 刘成 on 17/6/22.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LCTabbarStyle) {
    LCTabbarStyleNormal = 0,
    LCTabbarStyleCYLT
};

@interface LCTabbarService : NSObject

+ (instancetype)tabbarService;

@property (strong, nonatomic) UITabBarController *myTabbar;

- (UITabBarController *)getTabbarWithStyle:(LCTabbarStyle)style;

@end
