//
//  LCHttpResponseErrorHandler.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBaseRequestModel.h"

@interface LCHttpResponseErrorHandler : NSObject
+ (void)errorHandlerWithRequestDataModel:(LCBaseRequestModel *)requestDataModel responseURL:(NSURLResponse *)responseURL responseObject:(id)responseObject error:(NSError *)error errorHandler:(void(^)(NSError *newError))errorHandler;
@end
