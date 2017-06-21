//
//  LCHttpRequestGenerator.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBaseRequestModel.h"

@interface LCHttpRequestGenerator : NSObject

/**
 *  生成一个单例
 *
 */
+ (instancetype)sharedInstance;


- (NSURLRequest *)generateWithRequestDataModel:(LCBaseRequestModel *)dataModel;


@end
