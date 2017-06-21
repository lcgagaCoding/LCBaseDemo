//
//  LCManagerDataCenter.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCManagerDataCenter : NSObject


/**
 0 页面可以返回, 1不能返回
 */
@property (assign, nonatomic) BOOL cannotBack;

+ (LCManagerDataCenter *)shareManagerData ;




@end
