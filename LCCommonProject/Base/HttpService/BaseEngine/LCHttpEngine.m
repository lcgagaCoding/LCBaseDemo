//
//  LCHttpEngine.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCHttpEngine.h"

#import "LCHttpResultModel.h"
#import "MJExtension.h"

@implementation LCHttpEngine

+ (LCHttpBaseEngine *)postDictPath:(NSString *)path
                      param:(NSMutableDictionary *)param
                      control:(NSObject *)control
                      complete:(CompletionDataBlock)responseBlock
{

    return [LCHttpBaseEngine control:control callAPIWithPath:path param:param requestType:LCHttpRequestTypePost progressBlock:nil complete:^(id data, NSError *error) {
        
        id result = [[LCHttpResultModel class] mj_objectWithKeyValues:data];
        
        if (responseBlock) responseBlock(result, error);
    }];
}

+ (LCHttpBaseEngine *)getDictPath:(NSString *)path
                             param:(NSMutableDictionary *)param
                           control:(NSObject *)control
                          complete:(CompletionDataBlock)responseBlock
{
    
    return [LCHttpBaseEngine control:control callAPIWithPath:path param:param requestType:LCHttpRequestTypeGet progressBlock:nil complete:^(id data, NSError *error) {
        
        id result = [[LCHttpResultModel class] mj_objectWithKeyValues:data];
        
        if (responseBlock) responseBlock(result, error);
    }];
}

+ (LCHttpBaseEngine *)uploadDictPath:(NSString *)path
                             param:(NSMutableDictionary *)param
                           control:(NSObject *)control
                        dataFilePath:(NSString *)dataFilePath
                            dataName:(NSString *)dataName
                            fileName:(NSString *)fileName
                            mimeType:(NSString *)mimeType
                 uploadProgressBlock:(ProgressBlock)uploadProgressBlock
                            complete:(CompletionDataBlock)responseBlock
{
    
    return [LCHttpBaseEngine control:control uploadAPIWithPath:path param:param dataFilePath:dataFilePath dataName:dataName fileName:fileName mimeType:mimeType requestType:LCHttpRequestTypePostUpload uploadProgressBlock:uploadProgressBlock downloadProgressBlock:nil complete:^(id data, NSError *error) {
        
        if (responseBlock) responseBlock(data, error);
    }];
}

+ (LCHttpBaseEngine *)downloadDictPath:(NSString *)path
                             param:(NSMutableDictionary *)param
                           control:(NSObject *)control
            downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                          complete:(CompletionDataBlock)responseBlock
{
    
    return [LCHttpBaseEngine control:control uploadAPIWithPath:path param:param dataFilePath:nil dataName:nil fileName:nil mimeType:nil requestType:LCHttpRequestTypeGETDownload uploadProgressBlock:nil downloadProgressBlock:downloadProgressBlock complete:^(id data, NSError *error) {
        
        
        if (responseBlock) responseBlock(data, error);
    }];
}


@end
