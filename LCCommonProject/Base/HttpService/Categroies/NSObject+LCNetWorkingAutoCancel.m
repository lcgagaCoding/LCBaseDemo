//
//  NSObject+LCNetWorkingAutoCancel.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "NSObject+LCNetWorkingAutoCancel.h"
#import <objc/runtime.h>

@implementation NSObject (LCNetWorkingAutoCancel)

- (LCNetworkingAutoCancelRequests *)networkingAutoCancelRequests{
    LCNetworkingAutoCancelRequests *requests = objc_getAssociatedObject(self, @selector(networkingAutoCancelRequests));
    if (requests == nil) {
        requests = [[LCNetworkingAutoCancelRequests alloc]init];
        objc_setAssociatedObject(self, @selector(networkingAutoCancelRequests), requests, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return requests;
}

@end
