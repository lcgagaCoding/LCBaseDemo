//
//  LCBaseViewController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/23.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCBaseViewController ()

@end

@implementation LCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lineImageView = [self findHarirLineImageViewUnder:self.navigationController.navigationBar];
    
    self.view.backgroundColor = kUIColorFromRGB(0xffffff);
    
    [self initData];
    
    [self initView];
    
    [self loadData];
    
}

- (void)initData{}

- (void)initView{}

- (void)loadData{}


//去掉view和Navigation的横线
- (UIImageView *)findHarirLineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]]&&view.bounds.size.height <=1.0) {
        return (UIImageView *)view;
    }
    for (UIView * subview in view.subviews) {
        UIImageView * imageView = [self findHarirLineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)backClick:(UIButton *)button{
    [self.view endEditing:YES];
    
    
    if( [LCManagerDataCenter shareManagerData].cannotBack){
       
        //告知部分界面不能返回的事件触发
        [NotificationCenter postNotificationName:kCannotBackNotification object:nil];
        
        return;
    }
    
    NSInteger n = [self.navigationController.childViewControllers count];
    if (n>1)
    {
        //push
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        //present
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)dealloc{
    
    [self.clientEngine cancelRequest];
    self.clientEngine = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSString *str = NSStringFromClass([self class]);
    
    NSLog(@"%@ dealloc!",str);
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
