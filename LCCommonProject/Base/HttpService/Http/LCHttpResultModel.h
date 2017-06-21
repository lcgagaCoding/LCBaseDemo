//
//  LCHttpResultModel.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCHttpResultModel : NSObject

@property (nonatomic , copy) NSString *retCode;
@property (nonatomic , copy) NSString *retMsg;
@property (nonatomic , strong) NSDictionary * data;

@end
