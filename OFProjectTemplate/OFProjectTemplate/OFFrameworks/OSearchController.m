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
@property (nonatomic, strong) QMUILabel *hotSearch;
@property (nonatomic, strong) QMUIButton *clearBtn;
@property (nonatomic, strong) QMUILabel *searchHistory;
@property (nonatomic, strong) NSMutableArray *sources;
@end

@implementation OSearchContentView

- (instancetype)initWithHotSearches:(NSMutableArray *)sources {
    if (self = [super init]) {
        self.sources = sources;
        
        self.searchHistory = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
        self.searchHistory.text = @"搜索历史";
        [self addSubview:self.searchHistory];
        
        self.clearBtn = [[QMUIButton alloc] initWithImage:ImageNamed(@"tab_home_selected") title:nil];
        [self addSubview:self.clearBtn];
        
        self.floatLayoutView = [[QMUIFloatLayoutView alloc] init];
        self.floatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
        self.floatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
        for (NSInteger i = 0; i < sources.count; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:sources[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.floatLayoutView addSubview:button];
        }
        [self addSubview:self.floatLayoutView];
        
        self.hotSearch = [[QMUILabel alloc] initWithFont:OFFont(15) textColor:UIColorBlack];
        self.hotSearch.text = @"大家都在搜";
        [self addSubview:self.hotSearch];

        self.hFloatLayoutView = [[QMUIFloatLayoutView alloc] init];
        self.hFloatLayoutView.itemMargins = UIEdgeInsetsMake(0, 0, 10, 10);
        self.hFloatLayoutView.minimumItemSize = CGSizeMake(69, 29);// 以2个字的按钮作为最小宽度
        for (NSInteger i = 0; i < sources.count-5; i++) {
            QMUIGhostButton *button = [[QMUIGhostButton alloc] initWithGhostType:QMUIGhostButtonColorGray];
            [button setTitle:sources[i] forState:UIControlStateNormal];
            button.titleLabel.font = UIFontMake(14);
            button.contentEdgeInsets = UIEdgeInsetsMake(6, 20, 6, 20);
            [self.hFloatLayoutView addSubview:button];
        }
        [self addSubview:self.hFloatLayoutView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.searchHistory.frame = CGRectMake(10, 10, 100, 15);
    
    [self.clearBtn sizeToFit];
    self.clearBtn.center = CGPointMake(SCREEN_WIDTH-10-CGRectGetWidth(self.clearBtn.frame), self.searchHistory.center.y);
    
    CGSize fSize = [self.floatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
    self.floatLayoutView.frame = CGRectMake(10, CGRectGetMaxY(self.searchHistory.frame)+10, fSize.width, fSize.height);

    self.hotSearch.frame = CGRectMake(10, CGRectGetMaxY(self.floatLayoutView.frame)+10, 100, 15);
    
    CGSize fhSize = [self.hFloatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
    self.hFloatLayoutView.frame = CGRectMake(10, CGRectGetMaxY(self.hotSearch.frame)+10, fhSize.width, fhSize.height);
    
    
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

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    CGSize floatLayoutViewSize = [self.searchContentView.floatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
//    CGRect floatLayoutViewFrame = self.searchContentView.floatLayoutView.frame;
//    floatLayoutViewFrame.size.height = floatLayoutViewSize.height;
//    self.searchContentView.floatLayoutView.frame = floatLayoutViewFrame;
//    self.searchContentView.hotSearch.frame = CGRectMake(floatLayoutViewFrame.origin.x, CGRectGetMaxY(floatLayoutViewFrame)+10, 100, 15);
//    CGSize hFloatLayoutViewSize = [self.searchContentView.hFloatLayoutView sizeThatFits:CGSizeMake(SCREEN_WIDTH-20, CGFLOAT_MAX)];
//    CGRect hFloatLayoutViewFrame = self.searchContentView.hFloatLayoutView.frame;
//    hFloatLayoutViewFrame.size.height = hFloatLayoutViewSize.height;
//    self.searchContentView.hFloatLayoutView.frame = hFloatLayoutViewFrame;
//    
//}

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
