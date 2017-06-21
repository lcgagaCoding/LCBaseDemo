//
//  LCMainViewController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCMainViewController.h"
#import "LCLoginViewController.h"

@interface LCMainViewController ()


@end

@implementation LCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, kWIDTH, 200)];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
}
- (void)login{
    LCLoginViewController *lvc = [[LCLoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
