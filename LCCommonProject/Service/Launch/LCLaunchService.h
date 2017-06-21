//
//  LCLaunchService.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/27.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBaseViewController.h"
#import "AppDelegate.h"
typedef NS_ENUM(NSUInteger,LcLaunchType){
    
    LcLaunchTypeMain,                     //首页
    LcLaunchTypeLogin,                    //登录
    LcLaunchTypeGuide,                    //引导页
    
};

@interface LCLaunchService : NSObject

@property (strong, nonatomic) AppDelegate *delegate;

+ (instancetype)launchService;



/**
 应用启动时加载主界面

 @param delegate AppDelegate
 */
- (void)launchWindowWithDelegate:(AppDelegate *)delegate;


/**
 应用启动后根据制定type跳入相应界面

 @param type LcLaunchType
 */
- (void)launchWindowWithType:(LcLaunchType)type;

@end
