//
//  LCBaseTabBarController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/23.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCBaseTabBarController.h"
#import "LCBaseNavigationController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface LCBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation LCBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 49)];
    backView.backgroundColor = kUIColorFromRGB(0xffffff);
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    self.delegate = self;
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"LCMainViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"tabBar_home_n.png",
                                   kSelImgKey : @"tabBar_home_s.png"},
                                 
                                 @{kClassKey  : @"Test1ViewController",
                                   kTitleKey  : @"贷款",
                                   kImgKey    : @"tabBar_loan_n.png",
                                   kSelImgKey : @"tabBar_loan_s.png"},
                                 
                                 @{kClassKey  : @"Test2ViewController",
                                   kTitleKey  : @"车险",
                                   kImgKey    : @"tabBar_insurance_n.png",
                                   kSelImgKey : @"tabBar_insurance_s.png"},
                                 
                                 @{kClassKey  : @"Test3ViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tabBar_find_n.png",
                                   kSelImgKey : @"tabBar_find_s.png"},
                                 
                                 @{kClassKey  : @"Test4ViewController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"tabBar_me_n.png",
                                   kSelImgKey : @"tabBar_me_s.png"}];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        LCBaseNavigationController *nav = [[LCBaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        //        item.badgeValue = @"1";
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kUIColorFromRGB(0x5397e9)} forState:UIControlStateSelected];
        
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kUIColorFromRGB(0x757575),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        
        [self addChildViewController:nav];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
