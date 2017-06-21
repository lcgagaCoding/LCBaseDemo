//
//  LCAdviseView.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCAdviseView.h"
#import "AdviseModel.h"

@interface LCAdviseView()

@property (nonatomic, strong) UIImageView *adView;

@property (nonatomic, strong) UIButton *countBtn;

@property (nonatomic, strong) NSTimer *countTimer;


@property (nonatomic, assign) NSUInteger count;

@property (nonatomic, strong) AdviseModel *adviseModel;


/** 点击图片回调block */
@property (nonatomic,copy) void (^clickImg)(NSString *url);

@property (nonatomic, copy) void (^dismisBlock)();

@end

@implementation LCAdviseView

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

-(NSUInteger)showTime
{
    if (_showTime == 0)
    {
        _showTime = 3;
    }
    return _showTime;
}

- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}

/**
 初始化方法
 
 @param frame frame
 @param model 广告模型
 @param block 图片点击回调
 @param dismisBlock 广告页消失回调
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame adviseModel:(AdviseModel *)model clickImg:(void (^)(NSString *))block dismisBlock:(void (^)(void))dismisBlock{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _clickImg = block;
        _dismisBlock = dismisBlock;
        _adviseModel = model;
        
        
        //广告图片
        _adView = [[UIImageView alloc] initWithFrame:frame];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleAspectFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        
        //跳过按钮
        CGFloat btnW = 60;
        CGFloat btnH = 30;
        _countBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWIDTH - btnW - 24, btnH, btnW, btnH)];
        [_countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        _countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        _countBtn.layer.cornerRadius = 4;
        
        [self addSubview:_adView];
        [self addSubview:_countBtn];

    }
    
    return self;
}

//跳转到广告页面
- (void)pushToAd{
    if (_adviseModel)
    {
        //把所点击的广告链接回调出去
        _clickImg(_adviseModel.adviseUrl);
        [self dismiss];
    }
    
}

//跳过
- (void)countDown
{
    _count --;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%zd",_count] forState:UIControlStateNormal];
    if (_count == 0) {
        
        [self dismiss];
    }
}


// 定时器倒计时
- (void)startTimer
{
    _count = self.showTime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}


// 移除广告页面


- (void)dismiss
{
    [self.countTimer invalidate];
    self.countTimer = nil;
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        _dismisBlock();

    }];
}

- (void)show
{
    //判断本地缓存广告是否存在，存在即显示
    if (_adviseModel) {
        //设置按钮倒计时
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%zd", self.showTime] forState:UIControlStateNormal];
        //当前显示的广告图片
        _adView.image = [UIImage imageWithData:_adviseModel.imageData];

        //开启倒计时
        [self startTimer];
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        [window addSubview:self];
    }else{
        [self dismiss];
    }
    
}


@end
