//
//  LCHttpRequestGenerator.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCHttpRequestGenerator.h"
#import "AFURLRequestSerialization.h"


static NSTimeInterval kNetworkingTimeoutSeconds = 20.0f;

@interface LCHttpRequestGenerator ()

@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;
//@property (nonatomic, strong) AFJSONRequestSerializer *jsonRequestSerializer;

@end

@implementation LCHttpRequestGenerator


/**
 *  生成一个单例
 */
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static LCHttpRequestGenerator *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LCHttpRequestGenerator alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (NSURLRequest *)generateWithRequestDataModel:(LCBaseRequestModel *)dataModel{
    
    //获取环境配置参数
    NSString *apiBaseUrl = CommonHead;
    
    //获取通用参数
    NSMutableDictionary *commonParams = [NSMutableDictionary new];
    [commonParams addEntriesFromDictionary:dataModel.parameters];
    
    
    NSString *urlString = [self URLStringWithServiceUrl:apiBaseUrl path:dataModel.apiMethodPath];
    if ([dataModel.apiMethodPath containsString:@"http"]) {
        urlString = dataModel.apiMethodPath;
    }
    
    NSError *error;
    NSMutableURLRequest *request;
    
    if (dataModel.requestType == LCHttpRequestTypeGet || dataModel.requestType == LCHttpRequestTypeGETDownload ) {
        request = [self.httpRequestSerializer requestWithMethod:@"GET" URLString:urlString parameters:commonParams error:&error];
    } else if (dataModel.requestType == LCHttpRequestTypePost) {
        request = [self.httpRequestSerializer requestWithMethod:@"POST" URLString:urlString parameters:commonParams error:&error];
    } else if (dataModel.requestType == LCHttpRequestTypePostUpload) {
        request = [self.httpRequestSerializer multipartFormRequestWithMethod:@"POST" URLString:urlString parameters:commonParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            /**
             *  这里的参数配置也可以根据自己的设计修改默认值.
             为什么没有直接使用NSData?上传下载均用路径，后续管理方便
             */
            if (dataModel.dataFilePath.length>0) {
                NSURL *fileURL = [NSURL fileURLWithPath:dataModel.dataFilePath];
                NSString *name = dataModel.dataName?dataModel.dataName:@"data";
                NSString *fileName = dataModel.fileName?dataModel.fileName:@"data.zip";
                NSString *mimeType = dataModel.mimeType?dataModel.mimeType:@"application/zip";
                NSError *error;
                [formData appendPartWithFileURL:fileURL
                                           name:name
                                       fileName:fileName
                                       mimeType:mimeType
                                          error:&error];
            }
            
        } error:&error];
    }
    if (error || request == nil) {
        DELog(@"NSMutableURLRequests生成失败：\n---------------------------\n\
              urlString:%@\n\
              \n---------------------------\n",urlString);
        return nil;
    }
    
    request.timeoutInterval = kNetworkingTimeoutSeconds;
    return request;
}
#pragma mark - private methods
- (NSString *)URLStringWithServiceUrl:(NSString *)serviceUrl path:(NSString *)path{
    NSURL *fullURL = [NSURL URLWithString:serviceUrl];
    if (path.length>0) {
        fullURL = [NSURL URLWithString:path relativeToURL:fullURL];
    }
    if (fullURL == nil) {
        DELog(@"LCHttpRequestGenerator--URL拼接错误:\n---------------------------\n\
              apiBaseUrl:%@\n\
              urlPath:%@\n\
              \n---------------------------\n",serviceUrl,path);
        return nil;
    }
    return [fullURL absoluteString];
}
#pragma mark - getters and setters
- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _httpRequestSerializer.timeoutInterval = kNetworkingTimeoutSeconds;
        _httpRequestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    }
    return _httpRequestSerializer;
}



@end
