//
//  LCAppServiceCenter.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#ifndef LCAppServiceCenter_h
#define LCAppServiceCenter_h

#define ServiceHead @"https://www.xiaocaizhu365.com/api/"//线上环境

#define CommonHead [[NSUserDefaults standardUserDefaults] valueForKey:@"CommonHead"]



typedef NS_ENUM (NSUInteger, LCHttpRequestType){
    LCHttpRequestTypeGet,                       //get请求
    LCHttpRequestTypePost,                      //POST请求
    LCHttpRequestTypePostUpload,                //文件上传请求
    LCHttpRequestTypeGETDownload                //下载文件请求，不做返回值解析
};

typedef void (^ProgressBlock)(NSProgress *taskProgress);
typedef void (^CompletionDataBlock)(id data, NSError *error);


#endif /* LCAppServiceCenter_h */
