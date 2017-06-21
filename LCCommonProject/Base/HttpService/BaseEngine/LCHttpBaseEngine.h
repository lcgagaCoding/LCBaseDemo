//
//  LCHttpBaseEngine.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCAppServiceCenter.h"

@interface LCHttpBaseEngine : NSObject

/**
 *  取消self持有的hash的网络请求
 */
- (void)cancelRequest;

/**
 *  下面的区分get/post/upload/download只是为了上层Engine调用方便，实现都是一样的
 */

// get/post
+ (LCHttpBaseEngine *)control:(NSObject *)control
       callAPIWithPath:(NSString *)path
                        param:(NSDictionary *)parameters
                  requestType:(LCHttpRequestType)requestType
                progressBlock:(ProgressBlock)progressBlock
                   complete:(CompletionDataBlock)responseBlock;

// upload/download
+ (LCHttpBaseEngine *)control:(NSObject *)control
     uploadAPIWithPath:(NSString *)path
                        param:(NSDictionary *)parameters
                 dataFilePath:(NSString *)dataFilePath
                     dataName:(NSString *)dataName
                     fileName:(NSString *)fileName
                     mimeType:(NSString *)mimeType
                  requestType:(LCHttpRequestType)requestType
          uploadProgressBlock:(ProgressBlock)uploadProgressBlock
        downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                   complete:(CompletionDataBlock)responseBlock;

@end
