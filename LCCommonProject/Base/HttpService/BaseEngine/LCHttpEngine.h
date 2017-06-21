//
//  LCHttpEngine.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHttpBaseEngine.h"

@interface LCHttpEngine : NSObject

+ (LCHttpBaseEngine *)postDictPath:(NSString *)path
                             param:(NSMutableDictionary *)param
                           control:(NSObject *)control
                          complete:(CompletionDataBlock)responseBlock;

+ (LCHttpBaseEngine *)getDictPath:(NSString *)path
                            param:(NSMutableDictionary *)param
                          control:(NSObject *)control
                         complete:(CompletionDataBlock)responseBlock;

+ (LCHttpBaseEngine *)uploadDictPath:(NSString *)path
                               param:(NSMutableDictionary *)param
                             control:(NSObject *)control
                        dataFilePath:(NSString *)dataFilePath
                            dataName:(NSString *)dataName
                            fileName:(NSString *)fileName
                            mimeType:(NSString *)mimeType
                 uploadProgressBlock:(ProgressBlock)uploadProgressBlock
                            complete:(CompletionDataBlock)responseBlock;

+ (LCHttpBaseEngine *)downloadDictPath:(NSString *)path
                                 param:(NSMutableDictionary *)param
                               control:(NSObject *)control
                 downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                              complete:(CompletionDataBlock)responseBlock;

@end
