//
//  HoritzontalSectionsViewController.m
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "HoritzontalSectionsViewController.h"
#import "AirbnbTableViewCell.h"
#import "AirbnbCollectionView.h"
#import "AirbnbCollectionViewCell.h"

static CGFloat padding = 20.0f;

@interface HoritzontalSectionsViewController ()

@property (nonatomic, strong) NSMutableDictionary * contentOffsetDictionary;

@end

@implementation HoritzontalSectionsViewController

#pragma mark - Public

- (void)configureCollectionViewCell:(AirbnbCollectionViewCell *)cell atIndex:(NSUInteger)index indexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
    assert(0);
}

- (NSString *)collectionView:(AirbnbCollectionView *)collectionView cellIdentifierAtIndex:(NSUInteger)index {
    // Override this is subclass
    assert(0);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entries.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.entries.count ? 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const myCellIdentifier = @"AirbnbTableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:myCellIdentifier
                                                             forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(AirbnbTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    
    NSUInteger index = cell.collectionView.index;
    
    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionView setContentOffset:CGPointMake(horizontalOffset, 0)];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(AirbnbTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat horizontalOffset = cell.collectionView.contentOffset.x;
    NSUInteger index = cell.collectionView.index;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGRectGetHeight(tableView.bounds) / 3;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(AirbnbCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger index = collectionView.index;
    return ((NSArray *)self.entries[index]).count;
}

- (NSInteger)numberOfSectionsInCollectionView:(AirbnbCollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(AirbnbCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * myCollectionCellID = [self collectionView:collectionView cellIdentifierAtIndex:collectionView.index];
    AirbnbCollectionViewCell * cell = (AirbnbCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:myCollectionCellID forIndexPath:indexPath];
    
    [self configureCollectionViewCell:cell atIndex:collectionView.index indexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return padding;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds) - padding, CGRectGetHeight(collectionView.bounds) - padding);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, padding/2, 0, padding/2);
}

#pragma mark - Getters

- (NSMutableDictionary *)contentOffsetDictionary {
    if(!_contentOffsetDictionary) {
        _contentOffsetDictionary = [NSMutableDictionary new];
    }
    return _contentOffsetDictionary;
}

@end
