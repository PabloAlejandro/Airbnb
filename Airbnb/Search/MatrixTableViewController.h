//
//  MatrixTableViewController.h
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

//static NSString * const kCellIdentifier;
//static NSString * const headerCellIdentifier;

@interface MatrixTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)configureHeaderCell:(UITableViewCell *)cell atSection:(NSInteger)section;
- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, copy) NSArray * entries;

@end

