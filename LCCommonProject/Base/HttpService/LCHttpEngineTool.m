//
//  LCHttpEngineTool.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCHttpEngineTool.h"

@implementation LCHttpEngineTool

+ (LCHttpBaseEngine *)downloadImageWithControl:(NSObject *)control
                downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                    complete:(CompletionDataBlock)responseBlock{
    
    NSString *path = @"http://120.25.226.186:32812/resources/videos/minion_01.mp4";
    return [LCHttpEngine downloadDictPath:path param:nil control:control downloadProgressBlock:downloadProgressBlock complete:responseBlock];
}

@end
