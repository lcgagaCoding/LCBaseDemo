//
//  LCBaseWebController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/3/30.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCBaseWebController.h"

@interface LCBaseWebController ()<UIWebViewDelegate>

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation LCBaseWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)initView{
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    NSURL *url = [NSURL URLWithString:[_urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [_webView loadRequest:request];
    
}



#pragma mark webView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = title;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
