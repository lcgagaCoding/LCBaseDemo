//
//  LCBaseRequestModel.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCAppServiceCenter.h"

@interface LCBaseRequestModel : NSObject

/**
 *  网络请求参数
 */
@property (nonatomic, strong) NSString *apiMethodPath;              //网络请求地址
@property (nonatomic, strong) NSDictionary *parameters;             //请求参数
@property (nonatomic, assign) LCHttpRequestType requestType;  //网络请求方式
@property (nonatomic, copy) CompletionDataBlock responseBlock;      //请求着陆回调

// upload
// upload file
@property (nonatomic, strong) NSString *dataFilePath;
@property (nonatomic, strong) NSString *dataName;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *mimeType;

// download
// download file

// progressBlock
@property (nonatomic, copy) ProgressBlock uploadProgressBlock;
@property (nonatomic, copy) ProgressBlock downloadProgressBlock;
@end
