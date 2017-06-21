//
//  LCManagerCenter.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCManagerDataCenter.h"

@implementation LCManagerDataCenter

+ (LCManagerDataCenter *)shareManagerData{
    
    static LCManagerDataCenter *dc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dc = [[LCManagerDataCenter alloc]init];
    });
    return dc;
}

@end
