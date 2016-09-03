//
//  ListingTableCell.h
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListingTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView * mainImageView;
@property (nonatomic, weak) IBOutlet UIImageView * userImageView;
@property (nonatomic, weak) IBOutlet UIImageView * favouriteImageView;
@property (nonatomic, weak) IBOutlet UILabel * priceLabel;
@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * descriptionLabel;

@end
