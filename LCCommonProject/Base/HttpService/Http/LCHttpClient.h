//
//  LCHttpClient.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBaseRequestModel.h"
#import "LCHttpRequestGenerator.h"

@interface LCHttpClient : NSObject

+ (instancetype)sharedInstance;

/**
 *  根据dataModel发起网络请求，并根据dataModel发起回调
 *
 *
 *  @return 网络请求task哈希值
 */
- (NSNumber *)callRequestWithRequestModel:(LCBaseRequestModel *)requestModel;

/**
 *  取消网络请求
 */
- (void)cancelRequestWithRequestID:(NSNumber *)requestID;
- (void)cancelRequestWithRequestIDList:(NSArray<NSNumber *> *)requestIDList;

@end
