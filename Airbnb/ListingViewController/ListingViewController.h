//
//  ListingViewController.h
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "TablePaginationViewController.h"

@interface ListingViewController : TablePaginationViewController

@property (nonatomic, weak) IBOutlet UIView * tableHeaderView;
@property (nonatomic, weak) IBOutlet UILabel * tableHeaderTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * tableHeaderSubtitleLabel;
@property (nonatomic, weak) IBOutlet UIButton * tableHeaderFiltersButton;
@property (nonatomic, weak) IBOutlet UIButton * tableHeaderMapButton;
@property (nonatomic, weak) IBOutlet UIButton * tableHeaderBackButton;

@end
