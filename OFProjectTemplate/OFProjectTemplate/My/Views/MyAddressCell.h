//
//  MyAddressCell.h
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyAddressDelegate <NSObject>

-(void)MyAddressWithBtn:(UIButton *)btn;

@end

@interface MyAddressCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSString *)type;

@property (nonatomic, weak) id <MyAddressDelegate>delegate;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *defaultAddress;

@property (nonatomic, strong) UILabel *detailedAddress;

@property (nonatomic, strong) UILabel *provincesAddress;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIButton *defaultImage;

@property (nonatomic, strong) UIButton *editBtn;

@property (nonatomic, strong) UIButton *deleteBtn;

@end
