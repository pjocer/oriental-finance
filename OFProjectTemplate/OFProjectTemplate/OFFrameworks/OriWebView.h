//
//  OriWebView.h
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef void(^OriWebViewNormalBlock)(WKWebView *webView);
typedef void(^OriWebViewFailedBlock)(WKWebView *webView,NSError *error);
typedef void(^OriWebViewDecisionHandlerBlock)(WKNavigationActionPolicy decisionHandler);
typedef void(^OriWebViewHandlerBlock)(NSURLRequest *request,OriWebViewDecisionHandlerBlock decisionHandler);

@interface OriWebView : UIView
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, assign) CGFloat progressViewHeight;
@property (nonatomic, readonly, assign) CGFloat contentOffsetY;
@property (nonatomic, readonly, assign) CGSize contentSize;
@property (nonatomic, readonly, getter=isLoading) BOOL loading;
@property (nonatomic, readonly) double  estimatedProgress;
@property (nonatomic, readonly, strong) NSURL       *URL;
@property (nonatomic, readonly) BOOL    canGoBack;
@property (nonatomic, assign, getter=isShowProgress) BOOL showProgress;// 是否显示加载进度条 默认不显示
+ (instancetype)webView;
- (void)loadURL:(NSString *)url;
- (void)configureWithStartBlock:(OriWebViewNormalBlock)start
                    finishBlock:(OriWebViewNormalBlock)finish
                    failedBlock:(OriWebViewFailedBlock)failed;
- (void)configuration;
- (void)scrollToTop;
- (void)goBack;
- (void)stopLoading;
- (void)reload;
- (void)clearWebViewCache;
@end
