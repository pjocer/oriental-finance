//
//  OriWebView.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OriWebView.h"
#import <ReactiveCocoa.h>
#import <Masonry.h>
#import "OFUIkitMacro.h"
#import "OriRoute.h"
#import "H5LinkMacro.h"

@interface OriWebView () <WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>
@property (nonatomic, strong) WKWebView         *wkWebView;
@property (nonatomic, strong) UIProgressView    *progressView;
@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, assign) CGFloat contentOffsetY;
@property (nonatomic, readwrite, assign) CGSize contentSize;
@property (nonatomic, copy) OriWebViewNormalBlock startBlock;
@property (nonatomic, copy) OriWebViewNormalBlock finishBlock;
@property (nonatomic, copy) OriWebViewFailedBlock failedBlock;
@property (nonatomic, copy) OriWebViewHandlerBlock handlerBlock;
@end

@implementation OriWebView

+ (instancetype)webView {
    return [[OriWebView alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        [[[self commitSubviews] makeConstaints] subscribe].progressViewHeight = 1.f;
    }
    return self;
}

- (instancetype)commitSubviews {
    [self addSubview:self.wkWebView];
    [self addSubview:self.progressView];
    return self;
}

- (instancetype)makeConstaints {
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_greaterThanOrEqualTo(0.5);
    }];
    return self;
}

- (instancetype)subscribe {
    WEAKSELF
    [RACObserve(self.wkWebView.scrollView,contentOffset) subscribeNext:^(id x) {
        STRONGSELF
        self.contentOffsetY = [x CGPointValue].y;
        
    }];
    
    [[[RACObserve(self.wkWebView.scrollView, contentSize) skip:1] distinctUntilChanged] subscribeNext:^(id x) {
        STRONGSELF
        self.contentSize = [x CGSizeValue];
    }];
    
    [RACObserve(self.wkWebView, title) subscribeNext:^(id x) {
        STRONGSELF
        self.title = x ?: @"";
    }];
    
    [RACObserve(self.wkWebView, estimatedProgress) subscribeNext:^(id x) {
        STRONGSELF
        CGFloat progress = [x floatValue];
        [self.progressView setProgress:progress animated:(progress > self.progressView.progress)];
    }];
    return self;
}

- (void)configureWithStartBlock:(OriWebViewNormalBlock)start finishBlock:(OriWebViewNormalBlock)finish failedBlock:(OriWebViewFailedBlock)failed {
    self.startBlock = start;
    self.finishBlock = finish;
    self.failedBlock = failed;
}

- (void)configureWithHandlerBlock:(OriWebViewHandlerBlock)handler {
    self.handlerBlock = handler;
}

- (void)loadURL:(NSString *)url {
    if (STRINGHASVALUE(url)) {
        NSString *encodedString=[[H5HOST stringByAppendingString:url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:encodedString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.f];
        NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies];
        [request setAllHTTPHeaderFields:headers];
        [request addValue:@"iOS" forHTTPHeaderField:@"platform"];
        [self.wkWebView loadRequest:request];
    }
}

- (void)goBack {
    if (self.wkWebView.canGoBack) {
        [self.wkWebView goBack];
    }
}

- (void)stopLoading {
    [self.wkWebView stopLoading];
}

- (void)scrollToTop {
    [self.wkWebView.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)reload {
    [self.wkWebView reload];
}

- (void)clearWebViewCache {
    [self.wkWebView evaluateJavaScript:@"document.body.innerHTML = \"\";" completionHandler:nil];
}

- (void)configuration {
    [self configureWithHandlerBlock:^(NSURLRequest *request, OriWebViewDecisionHandlerBlock decisionHandler) {
        NSURL *url = request.URL;
        BOOL shouldDecisionHandler = [OriRoute canHandelWithURL:url completion:^(OriRouteHandlerType type, id response) {
            [self handleWithRouteHandlerType:type response:response];
        }];
        if (decisionHandler) {
            decisionHandler(shouldDecisionHandler ? WKNavigationActionPolicyCancel :WKNavigationActionPolicyAllow);
        }
    }];
}

- (void)handleWithRouteHandlerType:(OriRouteHandlerType)type response:(id)response {
    switch (type) {
        case OriRouteHandlerTypeJSCallBack:
        {
            if (STRINGHASVALUE(response)) {
                [self.wkWebView evaluateJavaScript:response completionHandler:^(id object, NSError * _Nullable error) {
                    
                }];
            }
        }
            break;
        case OriRouteHandlerTypeNavBack:
        {

        }
            break;
    }
}

#pragma mark - Navigation Delefate

/**
 *  页面开始加载时调用
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.progressView.hidden = !self.isShowProgress;
    if (self.startBlock) {
        self.startBlock(webView);
    }
}


/**
 *  页面加载完成之后调用
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.progressView.hidden = YES;
    if (self.finishBlock) {
        self.finishBlock(webView);
    }
}

/**
 *  加载失败时调用
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.progressView.hidden = YES;
    if (self.failedBlock) {
        self.failedBlock(webView,error);
    }
}


/**
 *  在发送请求之前，决定是否跳转
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    if (self.handlerBlock) {
        self.handlerBlock(navigationAction.request,decisionHandler);
    }else{
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}


- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"方法名:%@", message.name);
    NSLog(@"参数:%@", message.body);
    // 方法名
    NSString *methods = [NSString stringWithFormat:@"%@:", message.name];
    SEL selector = NSSelectorFromString(methods);
    // 调用方法
    if ([self respondsToSelector:selector]) {
        [self performSelector:selector withObject:message.body];
    } else {
        NSLog(@"未实行方法：%@", methods);
    }
}

#pragma mark - GETTER_SETTER
- (BOOL)isLoading {
    return self.wkWebView.isLoading;
}

- (double)estimatedProgress {
    return self.wkWebView.estimatedProgress;
}
- (BOOL)canGoBack {
    return self.wkWebView.canGoBack;
}
- (NSURL *)URL {
    return self.wkWebView.URL;
}
- (void)setProgressTintColor:(UIColor *)progressTintColor {
    _progressTintColor = progressTintColor;
    _progressView.progressTintColor = progressTintColor;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    _trackTintColor = trackTintColor;
    _progressView.trackTintColor = trackTintColor;
}

- (void)setProgressViewHeight:(CGFloat)progressViewHeight {
    _progressViewHeight = MAX(0.5, progressViewHeight);
    _progressView.transform = CGAffineTransformMakeScale(1.0f,0.50f * self.progressViewHeight);
}

- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator {
    _showsVerticalScrollIndicator = showsVerticalScrollIndicator;
    self.wkWebView.scrollView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)showsHorizontalScrollIndicator {
    _showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
    self.wkWebView.scrollView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;
}

- (WKWebView *)wkWebView {
    if (_wkWebView == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            UIWebView *webView = [[UIWebView alloc] init];
            NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
            NSString *newUserAgent = [NSString stringWithFormat:@"%@ %@/%@", userAgent,[[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey]];
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newUserAgent, @"UserAgent", nil];
            [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        });
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        [userContentController addScriptMessageHandler:self name:@"jsCallOC"];
        NSString *javaScriptSource = @"alert(\"注入js\");";
        WKUserScript *userScript = [[WKUserScript alloc] initWithSource:javaScriptSource injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        [userContentController addUserScript:userScript];
        
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = userContentController;
        _wkWebView = [[WKWebView alloc] initWithFrame:self.bounds configuration:configuration];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        _wkWebView.allowsBackForwardNavigationGestures = YES;
        _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
        _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _wkWebView;
}
- (UIProgressView *)progressView {
    if (_progressView == nil) {
        _progressView = [[UIProgressView alloc] init];
        _progressView.transform = CGAffineTransformMakeScale(1.0f,0.50f * self.progressViewHeight);
        _progressView.progressTintColor = self.progressTintColor ?: [UIColor redColor];
        _progressView.trackTintColor = self.trackTintColor ?: [UIColor clearColor];
        _progressView.backgroundColor = [UIColor clearColor];
        _progressView.hidden = YES;
    }
    return _progressView;
}
- (void)jsCallOC:(id)body {
    if ([body isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)body;
        NSString *jsStr = [NSString stringWithFormat:@"ocCallJS('%@')", [dict objectForKey:@"data"]];
        [self.wkWebView evaluateJavaScript:jsStr completionHandler:^(id _Nullable data, NSError * _Nullable error) {
            if (error) {
                NSLog(@"错误:%@", error.localizedDescription);
            }
        }];
    }
}
@end
