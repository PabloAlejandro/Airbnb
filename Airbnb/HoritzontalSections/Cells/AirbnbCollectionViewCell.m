//
//  AirbnbCollectionViewCell.m
//  AirbnbTable
//
//  Created by Pablo Alejandro Perez Martinez on 30/08/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "AirbnbCollectionViewCell.h"

@implementation AirbnbCollectionViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

#pragma mark - Getters

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectNull];
        [self addSubview:_imageView];
    }
    return _imageView;
}

@end
