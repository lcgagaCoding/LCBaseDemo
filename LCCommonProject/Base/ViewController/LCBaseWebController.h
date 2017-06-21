//
//  LCBaseWebController.h
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCBaseWebController : LCBaseViewController


/**
 传入的url
 */
@property (nonatomic, copy)NSString *urlStr;

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;

- (void)webViewDidStartLoad:(UIWebView *)webView;

- (void)webViewDidFinishLoad:(UIWebView *)webView;

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end
