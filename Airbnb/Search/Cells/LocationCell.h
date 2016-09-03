//
//  LocationCell.h
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView * cityImageView;

@end
