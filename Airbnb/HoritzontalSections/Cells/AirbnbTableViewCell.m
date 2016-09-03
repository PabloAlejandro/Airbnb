//
//  AirbnbTableViewCell.m
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 30/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "AirbnbTableViewCell.h"
#import "AirbnbCollectionView.h"
#import "AirbnbCollectionViewCell.h"

@implementation AirbnbTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.contentView.bounds;
}

#pragma mark - Public methods

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.index = indexPath.row;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    [self.collectionView reloadData];
}

#pragma mark - Getters

- (UICollectionView *)collectionView {
    if(!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[AirbnbCollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        
        static NSString * const myCollectionCellID = @"MyCollectionCellID";
        [_collectionView registerClass:[AirbnbCollectionViewCell class]
            forCellWithReuseIdentifier:myCollectionCellID];
        
        [self.contentView addSubview:_collectionView];
    }
    return _collectionView;
}

@end
