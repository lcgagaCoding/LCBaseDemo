//
//  AdviseModel.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/29.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCBaseModel.h"

@interface AdviseModel : LCBaseModel

@property (copy, nonatomic) NSString *imageUrl;//图片地址

@property (copy, nonatomic) NSString *adviseUrl;//广告跳转地址

@property (strong, nonatomic) NSData *imageData;//图片资源

@property (copy, nonatomic) NSString * adviseId;//广告id,


@end
