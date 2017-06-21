//
//  LCGuideView.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/17.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCGuideView.h"

@interface LCGuideView ()

@property (copy, nonatomic) ClickIndexBlock clickBlock;

@end

@implementation LCGuideView



/**
 初始化方法

 @param frame frame
 @param images 图片数组
 @param clickBlock 按钮点击事件,从左到右index从0开始
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images btnImages:(NSArray<NSString *> *)btnImages clickBlock:(ClickIndexBlock)clickBlock{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _clickBlock = clickBlock;
        
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.bounds];
        scroll.pagingEnabled = YES;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.contentSize = CGSizeMake(kWIDTH*images.count, kHEIGHT);
        [self addSubview:scroll];

        
        for (int i=0; i<images.count; i++) {
            
            NSString *imageName = images[i];
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*kWIDTH, 0, kWIDTH, kHEIGHT)];
            imageView.image = [UIImage imageNamed:imageName];
            imageView.userInteractionEnabled = YES;
            [scroll addSubview:imageView];
            
            if (i==images.count-1) {
                
                UIView *btnBgView = [[UIView alloc]initWithFrame:CGRectMake(0, VH(self)-100, VW(self), 40)];
                btnBgView.backgroundColor = [UIColor clearColor];
                [imageView addSubview:btnBgView];
                
                for (int j=0; j<btnImages.count; j++) {
                    CGFloat btnW = 1.0*VW(self)/btnImages.count;
                    CGFloat btnH = VH(btnBgView);
                    CGFloat centerX = btnW/2.0+btnW*j*1.0;
                    CGFloat centerY = VH(btnBgView)/2.0;
                    
                    NSString *btnImageName = btnImages[j];
                    UIButton *btn = [UIButton customWithFrame:CGRectMake(0, 0, btnW, btnH) bgImage:btnImageName target:self action:@selector(btnClick:)];
                    btn.center = CGPointMake(centerX, centerY);
                    btn.tag = 1000+j;
                    [btnBgView addSubview:btn];
                    
                }
                
                
            }
            
        }
        
        
    }
    
    return self;
}

- (void)btnClick:(UIButton *)button{
    NSInteger tag = button.tag-1000;
    
    _clickBlock(tag);
    [self dismiss];
}

- (void)show{
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [window addSubview:self];
}

- (void)dismiss
{

    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

@end
