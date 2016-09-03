//
//  MatrixTableViewController.m
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "MatrixTableViewController.h"

//static NSString * const kCellIdentifier = @"CellIdentifier";
static NSString * const kHeaderCellIdentifier = @"HeaderCellIdentifier";

@interface MatrixTableViewController ()

@end

@implementation MatrixTableViewController

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
    assert(0);
}

- (void)configureHeaderCell:(UITableViewCell *)cell atSection:(NSInteger)section {
    // Override this is subclass
    assert(0);
}

- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
    assert(0);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.entries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entries[section].count;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifieratIndexPath:indexPath]
                                                             forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if(!self.entries[section].count) {return nil;}
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kHeaderCellIdentifier];
    [self configureHeaderCell:cell atSection:section];
    
    UIView *view = [[UIView alloc] initWithFrame:cell.frame];
    [view addSubview:cell];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (CGRectGetHeight(tableView.frame) - 60) / 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return ((NSArray *)self.entries[section]).count ? 60 : 0;
}

@end
