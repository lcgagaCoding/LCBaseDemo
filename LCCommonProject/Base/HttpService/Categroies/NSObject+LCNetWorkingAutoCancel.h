//
//  NSObject+LCNetWorkingAutoCancel.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCNetworkingAutoCancelRequests.h"

@interface NSObject (LCNetWorkingAutoCancel)
/**
 将networkingRequestArray绑定到NSObject，当NSObject释放时networkingRequestArray也会释放
 *  networkingRequestArray存放requestid，当networkingRequestArray释放的时候，根据requestid取消没有返回的网络请求
 */
@property(nonatomic, strong, readonly) LCNetworkingAutoCancelRequests *networkingAutoCancelRequests;

@end
