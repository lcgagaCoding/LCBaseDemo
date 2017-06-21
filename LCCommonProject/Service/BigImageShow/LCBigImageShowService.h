//
//  LCBigImageShowService.h
//  LCCommonProject
//
//  Created by 刘成 on 17/4/14.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LCBigImageShowService : NSObject

/**
 *	@brief	浏览头像
 *
 *	@param 	selectedImageView 	头像所在的imageView
 */
+ (void)showBigImage:(UIImageView *)selectedImageView;

@end
