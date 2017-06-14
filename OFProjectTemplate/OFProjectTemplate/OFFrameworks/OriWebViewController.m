//
//  OriWebViewController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OriWebViewController.h"
#import "OFUIkitMacro.h"
#import <Masonry.h>
#import <ReactiveCocoa.h>

@interface OriWebViewController ()
@property (nonatomic, strong) OriWebView *webView;
@property (nonatomic, assign) BOOL webViewDidLoaded;
@end

@implementation OriWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!self.webViewDidLoaded) {
        [self reloadData];
    }
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
}

- (void)setup {
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [RAC(self,title) = RACObserve(self.webView, title) filter:^BOOL(id value) {
        return STRINGHASVALUE(value);
    }];
}

- (void)back{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }else{
        [super back];
    }
}
- (void)cancelLoad {
    [self.webView stopLoading];
    [self stopLoading];
}
- (void)reloadData {
    [self startLoading];
    if (STRINGHASVALUE(self.url)) {
        if (self.webView.isLoading) {
            [self.webView stopLoading];
        }
        [self.webView loadURL:self.url];
        [self performSelector:@selector(cancelLoad) withObject:nil afterDelay:30.f];
    }
}
- (OriWebView *)webView {
    if (_webView == nil) {
        _webView = [[OriWebView alloc] init];
        _webView.showProgress = YES;
        WEAKSELF
        [_webView configureWithStartBlock:^(WKWebView *webView) {
            STRONGSELF
            self.webViewDidLoaded = NO;
            [self startLoading];
        } finishBlock:^(WKWebView *webView) {
            STRONGSELF
            [self stopLoading];
            self.webViewDidLoaded = YES;
        } failedBlock:^(WKWebView *webView, NSError *error) {
            STRONGSELF
            [self stopLoading];
            self.webViewDidLoaded = YES;
        }];
        
        [_webView configuration];
    }
    return _webView;
}
- (void)dealloc {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self stopLoading];
    [self.webView clearWebViewCache];
    self.webViewDidLoaded = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
