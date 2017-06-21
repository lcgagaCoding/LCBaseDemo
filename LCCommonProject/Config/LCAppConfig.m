//
//  LCAppConfig.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/27.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCAppConfig.h"

@implementation LCAppConfig

+ (instancetype)config{
    static LCAppConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [LCAppConfig new];
    });
    return config;
}

/**
 获取版本号
 
 @return 版本号
 */
+ (NSString *)getVersionCode{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString * code = [NSString stringWithFormat:@"%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    return code;
}

/**
 获取当前控制器
 
 @return 控制器
 */
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                
                break;
            }
        }
    }
    id  nextResponder = nil;
    
    UIViewController *appRootVC=window.rootViewController;
    
    if (appRootVC.presentedViewController) {
        
        nextResponder = appRootVC.presentedViewController;
        
    }else{
        
        UIView *frontView = [[window subviews] objectAtIndex:0];
        
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        
        UIViewController * nav = (UIViewController *)nextResponder;
        
        result = nav.childViewControllers.lastObject;
        
    }else{
        
        result = nextResponder;
    }
    
    return result;
}

@end
