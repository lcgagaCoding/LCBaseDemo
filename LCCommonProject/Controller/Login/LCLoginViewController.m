//
//  LCLoginViewController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCLaunchService.h"

@interface LCLoginViewController ()

@end

@implementation LCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)loginClick:(id)sender {
    [[LCLaunchService launchService] launchWindowWithType:LcLaunchTypeMain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
