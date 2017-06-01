//
//  OSearchController.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/6/1.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "OSearchController.h"
#import "OFUIkitMacro.h"
#import "OShowHud.h"
#import "QMUIKit.h"
#import <Masonry.h>

@interface OSearchContentView : UIView
@property (nonatomic, strong) QMUIFloatLayoutView *floatLayoutView;
@property (nonatomic, strong) QMUIFloatLayoutView *hFloatLayoutView;
@property (nonatomic, strong) NSMutableArray *sources;
@end

@implementation OSearchContentView

- (instancetype)initWithHotSearches:(NSMutableArray *)sources {
    if (self = [super init]) {
        self.sources = sources;
        
        QMUILabel *searchHistory = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
        searchHistory.text = @"搜索历史";
        [self addSubview:searchHistory];
        
        [searchHistory mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
        }];
        
        QMUIButton *clearBtn = [[QMUIButton alloc] initWithImage:ImageNamed(@"tab_home_selected") title:nil];
        [self addSubview:clearBtn];
        
        [clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(-10);
            make.centerY.equalTo(searchHistory);
        }];
        
        self.floatLayoutView = [[QMUIFloatLayoutView alloc] init];
        self.floatLayoutView.padding = UIEdgeInsetsMake(12, 12, 12, 12);
        self.floatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
        self.floatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
        self.floatLayoutView.layer.borderWidth = PixelOne;
        self.floatLayoutView.layer.borderColor = UIColorSeparator.CGColor;
        [self addSubview:self.floatLayoutView];
        
        [self.floatLayoutView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(searchHistory.mas_bottom).offset(10);
            make.left.equalTo(searchHistory);
            make.right.equalTo(clearBtn);
        }];
        
        for (NSInteger i = 0; i < sources.count; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:sources[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.floatLayoutView addSubview:button];
        }
        
        CGSize floatLayoutViewSize = [self.floatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
        CGRect floatLayoutViewFrame = self.floatLayoutView.frame;
        floatLayoutViewFrame.size.height = floatLayoutViewSize.height;
        self.floatLayoutView.frame = floatLayoutViewFrame;
        
        
        
        QMUILabel *hotSearch = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
        hotSearch.text = @"大家都在搜";
        [self addSubview:hotSearch];
        
        [hotSearch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.floatLayoutView.mas_bottom).offset(10);
            make.left.equalTo(searchHistory);
        }];
        
        self.hFloatLayoutView = [[QMUIFloatLayoutView alloc] init];
        self.hFloatLayoutView.padding = UIEdgeInsetsMake(12, 12, 12, 12);
        self.hFloatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
        self.hFloatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
        self.hFloatLayoutView.layer.borderWidth = PixelOne;
        self.hFloatLayoutView.layer.borderColor = UIColorSeparator.CGColor;
        [self addSubview:self.hFloatLayoutView];
        
        [self.hFloatLayoutView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(hotSearch).offset(10);
            make.left.right.equalTo(self.floatLayoutView);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        for (NSInteger i = 0; i < sources.count; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:sources[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.hFloatLayoutView addSubview:button];
        }
    }
    
    return self;
}


@end

@interface OSearchController () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) OSearchContentView *searchContentView;
@end

@implementation OSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc]init]];
    [self.view addSubview:self.searchContentView];
    [self.searchContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
        _searchContentView = [[OSearchContentView alloc] initWithHotSearches:[NSMutableArray arrayWithArray:@[@"东野圭吾", @"三体", @"爱", @"红楼梦", @"理智与情感", @"读书热榜", @"免费榜"]]];
        
    }
    return _searchContentView;
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
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (!STRINGHASVALUE(searchBar.text)) {
        [OShowHud showErrorHudWith:@"请先输入搜索内容" animated:YES];
    }
}

@end
