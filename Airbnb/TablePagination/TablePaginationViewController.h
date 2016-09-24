//
//  TablePaginationViewController.h
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TablePaginationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (void)tableViewShouldLoadMoreEntries;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView * activityIndicator;
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, copy) NSArray *  entries;
@property (nonatomic, assign) NSUInteger page;

@end
