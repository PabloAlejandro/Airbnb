//
//  AirbnbTableViewCell.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 30/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirbnbCollectionView;

@interface AirbnbTableViewCell : UITableViewCell

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) AirbnbCollectionView * collectionView;

@end
