//
//  LCAppConfig.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/27.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LCAppConfig : NSObject

+ (instancetype)config;


/**
 获取版本号

 @return 版本号
 */
+ (NSString *)getVersionCode;


/**
 获取当前控制器

 @return 控制器
 */
+ (UIViewController *)getCurrentVC;

@end
