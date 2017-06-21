//
//  CrashReport.h
//  CrashReport
//
//  Created by Ryan on 15/1/5.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const UncaughtExceptionHandlerSignalKey;
extern NSString *const SingalExceptionHandlerAddressesKey;
extern NSString *const ExceptionHandlerAddressesKey;

@interface CrashReport : NSObject

+ (void)installExceptionHandler;
+ (NSArray *)backtrace;
+ (void)handleException:(NSException *)exception;

@end

