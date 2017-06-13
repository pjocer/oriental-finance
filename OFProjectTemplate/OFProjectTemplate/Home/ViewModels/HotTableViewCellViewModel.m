//
//  HotTableViewCellViewModel.m
//  OFProjectTemplate
//
//  Created by 吉冠虎 on 2017/5/27.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "HotTableViewCellViewModel.h"
#import "VerticalVideoCollectionCell.h"
#import "OFUIkitMacro.h"
#import "OFHomeMacro.h"
#import "HoritalVideoCollectionCell.h"
#import "ChannelLiveHeaderView.h"

@interface HotTableViewCellViewModel ()
@property (nonatomic, assign) TableViewCellType type;
@end

@implementation HotTableViewCellViewModel

- (instancetype)initWithCellType:(TableViewCellType)type {
    if (self = [super init]) {
        self.type = type;
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.type == TableViewCellTypeHot) {
        return 6;
    }
    if (self.type == TableViewCellTypeLiving) {
        return 4;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    if (self.type == TableViewCellTypeHot) {
        VerticalVideoCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:VerticalVideoCollectionCellIdentifier forIndexPath:indexPath];
        cell.shouldShowAppointBtns = self.shouldShowAppointBtn;
        return cell;
    }
    if (self.type == TableViewCellTypeLiving) {
        cell = (HoritalVideoCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:HoritalVideoCollectionCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.type == TableViewCellTypeHot) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123" forIndexPath:indexPath];
        return view;
    }
    if (self.type == TableViewCellTypeLiving) {
        ChannelLiveHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ChannelLiveHeaderViewIdentifier forIndexPath:indexPath];
        header.clickAction = self.headerClickAction;
        return header;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (self.type == TableViewCellTypeHot) {
        return CGSizeZero;
    }
    if (self.type == TableViewCellTypeLiving) {
        return CGSizeMake(SCREEN_WIDTH, 204.f);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == TableViewCellTypeHot) {
        return CGSizeMake((SCREEN_WIDTH-10)/3.f, VerticalVideoCellHeight);
    }
    if (self.type == TableViewCellTypeLiving) {
        return CGSizeMake((SCREEN_WIDTH-5)/2.f, 160.f);
    }
    return CGSizeZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (self.type == TableViewCellTypeHot) {
        return 5.f;
    }
    if (self.type == TableViewCellTypeLiving) {
        return 5.f;
    }
    return 0.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.f;
}

@end
