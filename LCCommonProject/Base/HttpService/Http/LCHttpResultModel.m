//
//  LCHttpResultModel.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/1.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCHttpResultModel.h"

@implementation LCHttpResultModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(void)setNilValueForKey:(NSString *)key{
    
}
- (void)setRetCode:(NSString *)retCode {
    _retCode = [NSString stringWithFormat:@"%@",retCode];
}

@end
