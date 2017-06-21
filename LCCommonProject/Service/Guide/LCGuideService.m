//
//  LCGuideService.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCGuideService.h"
#import "LCGuideView.h"
@implementation LCGuideService

/**
 展示引导页
 */
+ (void)showGuide{
    
    NSArray *imagesArray = @[@"",@"",@"",@""];
    NSArray *btnsArray = @[@"",@""];

    
    LCGuideView *guideView = [[LCGuideView alloc]initWithFrame:[[UIScreen mainScreen] bounds] images:imagesArray btnImages:btnsArray clickBlock:^(NSInteger index) {
        
        switch (index) {
            case 0:
                
                break;
                
            default:
                break;
        }
        
    }];
    [guideView show];
}

- (void)gotoLogin{
    //可以获取到具体哪个tabbar的navigation,此处视需求而定,
    UIViewController *vc = [LCAppConfig getCurrentVC];
    
//    LCAdviseWebController *web = [[LCAdviseWebController alloc]init];
//    web.urlStr = model.adviseUrl;
//    vc.hidesBottomBarWhenPushed = YES;
//    [vc.navigationController pushViewController:web animated:YES];

}
@end
