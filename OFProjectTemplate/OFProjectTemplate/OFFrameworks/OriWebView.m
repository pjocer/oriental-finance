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

@interface OriWebView () <WKUIDelegate, WKNavigationDelegate>
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
        [[[self commitSubviews] makeConstaints] subscribe].backgroundColor = UIColorWhite;
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
    self.progressViewHeight = 1.0;
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
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.f];
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
        case OriRouteHandlerTypeSetShareInfo:
        {

        }
            break;
        case OriRouteHandlerTypeSetTitle:
        {

        }
            break;
        case OriRouteHandlerTypeNavBack:
        {

        }
            break;
    }
}

- (id)getPrivateProperty:(NSString *)propertyName
{
    Ivar iVar = class_getInstanceVariable([self class], [propertyName UTF8String]);
    
    if (iVar == nil) {
        iVar = class_getInstanceVariable([self class], [[NSString stringWithFormat:@"_%@",propertyName] UTF8String]);
    }
    
    id propertyVal = object_getIvar(self, iVar);
    return propertyVal;
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
- (void)setProgressViewHeight:(CGFloat)progressViewHeight {
    _progressViewHeight = MAX(0.5, progressViewHeight);
    _progressView.transform = CGAffineTransformMakeScale(1.0f,0.50f * self.progressViewHeight);
}

- (WKWebView *)wkWebView {
    if (_wkWebView == nil) {
        //设置UA（ios8不支持customUA，统一使用这个办法)
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            UIWebView *webView = [[UIWebView alloc] init];
            NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
            NSString *newUserAgent = [NSString stringWithFormat:@"%@ %@/%@", userAgent,[[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey]];
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newUserAgent, @"UserAgent", nil];
            [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        });
        _wkWebView = [[WKWebView alloc] initWithFrame:self.bounds];
        _wkWebView.UIDelegate = self;
        _wkWebView.navigationDelegate = self;
        _wkWebView.allowsBackForwardNavigationGestures = YES;
        _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
        _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
        
        WEAKSELF
        [RACObserve(_wkWebView, estimatedProgress) subscribeNext:^(id x) {
            STRONGSELF
            CGFloat progress = [x floatValue];
            [self.progressView setProgress:progress animated:(progress > self.progressView.progress)];
        }];
        
        [RACObserve(_wkWebView, title) subscribeNext:^(id x) {
            STRONGSELF
            self.title = self.wkWebView.title;
        }];
        
    }
    return _wkWebView;
}

@end
