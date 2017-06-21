//
//  LCNetworkingAutoCancelRequests.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCNetworkingAutoCancelRequests.h"

@interface LCNetworkingAutoCancelRequests()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *,LCHttpBaseEngine *> *requestEngines;

@end

@implementation LCNetworkingAutoCancelRequests

-(void)dealloc{
    [self.requestEngines removeAllObjects];
    self.requestEngines = nil;
}
- (NSMutableDictionary *)requestEngines
{
    if (_requestEngines == nil) {
        _requestEngines = [[NSMutableDictionary alloc] init];
    }
    return _requestEngines;
}

- (void)setEngine:(LCHttpBaseEngine *)engine requestID:(NSNumber *)requestID
{
    if (engine && requestID) {
        self.requestEngines[requestID] = engine;
    }
}

- (void)removeEngineWithRequestID:(NSNumber *)requestID
{
    if (requestID) {
        //        NSArray *keys = self.requestEngines.allKeys;
        //        if ([keys containsObject:requestID]) {
        [self.requestEngines removeObjectForKey:requestID];
        //        } else {
        //            __block NSMutableArray *needRemove = [[NSMutableArray alloc] init];
        //            [keys enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //                if ([requestID isEqualToNumber:obj]) {
        //                    [needRemove addObject:obj];
        //                }
        //            }];
        //            if (needRemove.count > 0) {
        //                [self.requestEngines removeObjectsForKeys:needRemove];
        //            }
        //        }
    }
}
@end
