//
//  SMHomeGoodsDetailItemController.m
//  CHMall
//
//  Created by pro on 2017/1/11.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMHomeGoodsDetailItemController.h"
#import <WebKit/WebKit.h>

@interface SMHomeGoodsDetailItemController ()<WKNavigationDelegate>

@end

@implementation SMHomeGoodsDetailItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView * webView =[[WKWebView alloc]init];
    webView.navigationDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:20]];
    [self.view addSubview:webView];
    webView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}
#pragma mark - <WKNavigationDelegate>
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}

@end
