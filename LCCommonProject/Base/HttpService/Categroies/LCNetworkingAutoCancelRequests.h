//
//  LCNetworkingAutoCancelRequests.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHttpBaseEngine.h"
@interface LCNetworkingAutoCancelRequests : NSObject

- (void)setEngine:(LCHttpBaseEngine *)engine requestID:(NSNumber *)requestID;
- (void)removeEngineWithRequestID:(NSNumber *)requestID;
@end
