//
//  LCHttpEngineTool.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCHttpEngine.h"

@interface LCHttpEngineTool : NSObject

//http://www.xiaocaizhu365.com/oss/file/20161223/201612231445512361712598.jpg

+ (LCHttpBaseEngine *)downloadImageWithControl:(NSObject *)control
                         downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                                      complete:(CompletionDataBlock)responseBlock;
@end
