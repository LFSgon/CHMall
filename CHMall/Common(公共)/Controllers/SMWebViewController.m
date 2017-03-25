//
//  SMWebViewController.m
//  CHMall
//
//  Created by pro on 2017/1/12.
//  Copyright © 2017年 Fyy. All rights reserved.
//

#import "SMWebViewController.h"
#import <WebKit/WebKit.h>
@interface SMWebViewController ()<WKNavigationDelegate>
@property(nonatomic,strong)WKWebView * webView;
@end

@implementation SMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView * webView =[[WKWebView alloc]init];
    webView.navigationDelegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:20]];
    [self.view addSubview:webView];
    webView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

- (void)setWebViewType:(SMWebViewType)webViewType{
    _webViewType = webViewType;
    NSString * urlStr ;
    switch (webViewType) {
        case webViewTypeProtocol:{
            [self initTitleView:@"用户协议"];
            urlStr = @"https://www.baidu.com";
        }
            break;
        case webViewTypeAboutUs:{
            [self initTitleView:@"关于我们"];
            urlStr = @"https://www.baidu.com";
        }
            break;
        case webViewTypeUseHelp:{
            [self initTitleView:@"使用帮助"];
            urlStr = @"https://www.baidu.com";
        }
            break;
        default:
            break;
    }
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:20]];
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
