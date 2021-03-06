//
//  GTDetailViewController.m
//  GeekSampleApp
//
//  Created by zhumuzhi on 2019/10/28.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>
#import "GTScreen.h"

@interface GTDetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, copy) NSString *articleUrl;

@end

@implementation GTDetailViewController


- (instancetype)initWithUrlString:(NSString *)urlSting {
    
    self = [super init];
    if (self) {
        self.articleUrl = urlSting;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, STATUSBARHEIGHT + 44, self.view.frame.size.width, self.view.frame.size.height - STATUSBARHEIGHT - 44)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    if (!self.articleUrl) {
        self.articleUrl = @"https://time.geekbang.org";
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 不做处理直接加载
    decisionHandler(WKNavigationActionPolicyAllow);
    
    NSLog(@"%s", __func__);
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    //Webview加载完成
    //此时并不代表整个Web页面已经渲染结束
    NSLog(@"%s", __func__);
}


@end
