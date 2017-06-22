//
//  LCLaunchService.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/27.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCLaunchService.h"
#import "LCTabbarService.h"

#import "LCAppConfig.h"
#import "LCBaseTabBarController.h"
#import "LCAdviseService.h"
#import "LCGuideService.h"
#import "LCAppServiceCenter.h"
#import "LCLoginViewController.h"
#import "IQKeyboardManager.h"

@implementation LCLaunchService

static NSString *launchServiceAppVersion = @"launchServiceAppVersion";


+ (instancetype)launchService{
    
    static LCLaunchService *service = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[LCLaunchService alloc]init];
        
    });
    return service;
}


/**
 配置服务器基地址
 */
- (void)configService{
    NSString *url = CommonHead;
    if (url.length==0) {
        [[NSUserDefaults standardUserDefaults] setValue:ServiceHead forKey:@"CommonHead"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)launchWindowWithDelegate:(AppDelegate *)delegate{
    
    
    _delegate = delegate;
    
    //设置主窗口
    [self createWindow];
    
    //设置主窗口
    [self configKeyBoard];
    
    //配置环境地址
    [self configService];
    
    //是否第一次加载
    if ([self checkAppIsFirstLaunch]) {
        
        [self launchWindowWithType:LcLaunchTypeGuide];
    }else{

        //根据具体需求判断是否需要跳登录,如果是登录,则改为LcLaunchTypeLogin
        [self launchWindowWithType:LcLaunchTypeLogin];
        
        //加载广告页
        [LCAdviseService showAdvise];
    }
}


/**
 设置主窗口
 */
- (void)createWindow{
    _delegate.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _delegate.window.backgroundColor = [UIColor whiteColor];
    [_delegate.window makeKeyAndVisible];
}


/**
 设置键盘
 */
- (void)configKeyBoard{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldShowTextFieldPlaceholder = NO;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
}

/**
 指定rootViewController
 
 @param type 首页,登录页,引导页
 */
- (void)launchWindowWithType:(LcLaunchType)type{
 
    switch (type) {
        case LcLaunchTypeMain:
            [self pushMain];
            break;
        case LcLaunchTypeLogin:
            [self pushLogin];
            break;
        case LcLaunchTypeGuide:
            [self pushGuide];
            break;
        default:
            break;
    }
    
}

- (BOOL)checkAppIsFirstLaunch{
    NSString *version =  [[NSUserDefaults standardUserDefaults] objectForKey:launchServiceAppVersion];
    if (!version) {
        NSString *code = [LCAppConfig getVersionCode];
        [[NSUserDefaults standardUserDefaults] setValue:code?:@"" forKey:launchServiceAppVersion];
        return YES;
    }
    return NO;
}

- (void)pushMain{
    UITabBarController *tabbar = [[LCTabbarService tabbarService] getTabbarWithStyle:LCTabbarStyleCYLT];
    [UIApplication sharedApplication].delegate.window.rootViewController = tabbar;
}

- (void)pushGuide{
    
    [LCGuideService showGuide];
    UITabBarController *tabbar = [[LCTabbarService tabbarService] getTabbarWithStyle:LCTabbarStyleNormal];
    [UIApplication sharedApplication].delegate.window.rootViewController = tabbar;
}
- (void)pushLogin{

    LCLoginViewController *lvc  = [[LCLoginViewController alloc]init];
    [UIApplication sharedApplication].delegate.window.rootViewController = lvc;
}
@end
