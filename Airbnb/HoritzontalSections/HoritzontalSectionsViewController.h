//
//  AirbnbTableViewController.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirbnbCollectionView;
@class AirbnbCollectionViewCell;

@interface HoritzontalSectionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (void)configureCollectionViewCell:(AirbnbCollectionViewCell *)cell atIndex:(NSUInteger)index indexPath:(NSIndexPath *)indexPath;
- (NSString *)collectionView:(AirbnbCollectionView *)collectionView cellIdentifierAtIndex:(NSUInteger)index;

@property (nonatomic, weak) IBOutlet UITableView * tableView;
//@property (nonatomic, copy) NSArray <NSArray *> * entries;
@property (nonatomic, copy) NSArray * entries;

@end
