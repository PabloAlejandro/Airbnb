//
//  ListingTableCell.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "ListingTableCell.h"

@implementation ListingTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.userImageView.layer.cornerRadius = CGRectGetHeight(self.userImageView.frame) / 2;
    self.userImageView.layer.masksToBounds = true;
    
    self.mainImageView.layer.masksToBounds = true;
}

@end
