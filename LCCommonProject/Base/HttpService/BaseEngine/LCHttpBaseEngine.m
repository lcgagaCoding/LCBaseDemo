//
//  LCHttpBaseEngine.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCHttpBaseEngine.h"
#import "LCBaseRequestModel.h"
#import "LCHttpClient.h"
#import "NSObject+LCNetWorkingAutoCancel.h"


@interface LCHttpBaseEngine ()

@property (nonatomic, strong) NSNumber *requestID;

@end

@implementation LCHttpBaseEngine

/**
 *  取消self持有的hash的网络请求
 */
- (void)cancelRequest{
    
    [[LCHttpClient sharedInstance] cancelRequestWithRequestID:self.requestID];
}

/**
 *  下面的区分get/post/upload/download只是为了上层Engine调用方便，实现都是一样的
 */

// get/post
+ (LCHttpBaseEngine *)control:(NSObject *)control
            callAPIWithPath:(NSString *)path
                      param:(NSDictionary *)parameters
                requestType:(LCHttpRequestType)requestType
              progressBlock:(ProgressBlock)progressBlock
                   complete:(CompletionDataBlock)responseBlock{

    LCHttpBaseEngine *engine = [[LCHttpBaseEngine alloc]init];
    __weak typeof(control) weakControl = control;

    LCBaseRequestModel *dataModel = [engine dataModelWithPath:path param:parameters dataFilePath:nil dataName:nil fileName:nil mimeType:nil requestType:requestType uploadProgressBlock:progressBlock downloadProgressBlock:nil complete:^(id data, NSError *error) {
        if (responseBlock) {
            //可以在这里做错误的UI处理，或者是在上层engine做
            responseBlock(data,error);
        }
        [weakControl.networkingAutoCancelRequests removeEngineWithRequestID:engine.requestID];
    }];
    [engine callRequestWithRequestModel:dataModel control:control];
    return engine;

}

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
                   complete:(CompletionDataBlock)responseBlock{

    LCHttpBaseEngine *engine = [[LCHttpBaseEngine alloc]init];
    __weak typeof(control) weakControl = control;
    LCBaseRequestModel *dataModel = [engine dataModelWithPath:path param:parameters dataFilePath:dataFilePath dataName:dataName fileName:fileName mimeType:mimeType requestType:requestType uploadProgressBlock:uploadProgressBlock downloadProgressBlock:downloadProgressBlock complete:^(id data, NSError *error) {
        if (responseBlock) {
            //可以在这里做错误的UI处理，或者是在上层engine做
            responseBlock(data,error);
        }
        [weakControl.networkingAutoCancelRequests removeEngineWithRequestID:engine.requestID];
    }];
    [engine callRequestWithRequestModel:dataModel control:control];
    return engine;

}

- (LCBaseRequestModel *)dataModelWithPath:(NSString *)path
                                       param:(NSDictionary *)parameters
                                dataFilePath:(NSString *)dataFilePath
                                    dataName:(NSString *)dataName
                                    fileName:(NSString *)fileName
                                    mimeType:(NSString *)mimeType
                                 requestType:(LCHttpRequestType)requestType
                         uploadProgressBlock:(ProgressBlock)uploadProgressBlock
                       downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                                    complete:(CompletionDataBlock)responseBlock
{
    LCBaseRequestModel *dataModel = [[LCBaseRequestModel alloc]init];
    dataModel.apiMethodPath = path;
    dataModel.parameters = parameters;
    dataModel.dataFilePath = dataFilePath;
    dataModel.dataName = dataName;
    dataModel.mimeType = mimeType;
    dataModel.requestType = requestType;
    dataModel.uploadProgressBlock = uploadProgressBlock;
    dataModel.downloadProgressBlock = downloadProgressBlock;
    dataModel.responseBlock = responseBlock;
    return dataModel;
}

- (void)callRequestWithRequestModel:(LCBaseRequestModel *)dataModel control:(NSObject *)control{
    self.requestID = [[LCHttpClient sharedInstance] callRequestWithRequestModel:dataModel];
    [control.networkingAutoCancelRequests setEngine:self requestID:self.requestID];
}

#pragma mark - life cycle
- (void)dealloc{
    [self cancelRequest];
}

@end
