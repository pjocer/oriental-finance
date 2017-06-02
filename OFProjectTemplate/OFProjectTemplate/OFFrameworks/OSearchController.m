//
//  OSearchController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/1.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchController.h"
#import "OShowHud.h"
#import "OSearchContentView.h"
#import <Masonry.h>
#import "OSearchContentViewModel.h"

@interface OSearchController () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) OSearchContentView *searchContentView;
@property (nonatomic, strong) OSearchContentViewModel *viewModel;
@end

@implementation OSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commitViews];
    [self initSearchData];
    [self subscribe];
}

- (void)initSearchData {
    WEAKSELF
    [self.viewModel fetchHotSearchWithCompeletion:^{
        STRONGSELF
        self.searchContentView.sources = @[@"东野圭吾", @"三体", @"爱", @"红楼梦", @"理智与情感", @"读书热榜", @"免费榜"];
    }];
    self.searchContentView.histories = [self.viewModel searhHistory];
}

- (void)commitViews {
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc]init]];
    [self.view addSubview:self.searchContentView];
    [self.searchContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)subscribe {
    [self.searchContentView.clearBtnSignal subscribeNext:^(id x) {
        [self.viewModel deleteSearchHistory];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (![self.searchBar isFirstResponder]) {
        [self.searchBar becomeFirstResponder];
    }
}

- (OSearchContentView *)searchContentView {
    if (!_searchContentView) {
        _searchContentView = [[OSearchContentView alloc] init];
    }
    return _searchContentView;
}

- (OSearchContentViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [OSearchContentViewModel new];
    }
    return _viewModel;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        [_searchBar setSearchFieldBackgroundImage:ImageNamed(@"search_bg") forState:UIControlStateNormal];
        [_searchBar setImage:ImageNamed(@"m_12") forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        _searchBar.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0.5, 0);
        _searchBar.placeholder = @"搜搜看你想要的视频吧";
        _searchBar.delegate = self;
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
        _searchBar.layer.borderWidth = 0.5;
        _searchBar.showsCancelButton = YES;
        if (STRINGHASVALUE(self.searchWord)) _searchBar.text = self.searchWord;
    }
    return _searchBar;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES];
    for (id subView in [self.searchBar.subviews[0] subviews]) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *cancelBtn = subView;
            [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
            [cancelBtn setTintColor:HexColor(0x969696)];
        }
    }
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self back];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (!STRINGHASVALUE(searchBar.text)) {
        [OShowHud showErrorHudWith:@"请先输入搜索内容" animated:YES];
    }
    [self.viewModel saveSearchHistory:searchBar.text];
}

@end
