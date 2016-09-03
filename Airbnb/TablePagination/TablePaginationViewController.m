//
//  TablePaginationViewController.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "TablePaginationViewController.h"

static NSString * const kPaginationCellID = @"PaginationCellID";

@implementation TablePaginationViewController

- (void)tableViewShouldLoadMoreEntries {
    // Override this in subclass
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Override this in subclass
    cell.textLabel.text = self.entries[indexPath.row];
}

- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath {
    // Override this in subclass
    return kPaginationCellID;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.entries.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entries.count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifieratIndexPath:indexPath]
                                                             forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        [self tableViewShouldLoadMoreEntries];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
