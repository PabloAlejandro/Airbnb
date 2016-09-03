//
//  ListingViewController.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "ListingViewController.h"
#import "ListingTableCell.h"
#import "AirbnbRequest.h"
#import "Airbnb.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString * const kEndpoint = @"https://api.airbnb.com/v2/search_results";

@interface ListingViewController ()

@property (nonatomic, strong) AirbnbRequest * airbnbRequest;

@end

@implementation ListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL * url = [NSURL URLWithString:kEndpoint];
    
    __weak typeof (self) weakSelf = self;
    
    self.airbnbRequest.url = url;
    self.airbnbRequest.parameters = [self requestParamsForClientId:@"3092nxybyb0otqw18e8nh5nty" locale:@"en-US" currency:@"USD" format:@"for_search_results_with_minimal_pricing" limit:@(20) offset:@(0) fetch_facets:@(true) guests:@(1) ib:@(false) ib_add_photo_flow:@(true) location:@"Lake%20Tahoe%2C%20CA%2C%20US" min_bathrooms:@(0) min_bedrooms:@(0) min_num_pic_urls:@(10) price_max:@(210) price_min:@(40) sort:@(1) user_lat:@(37.3398634) user_lng:@(-122.0455164)];
    
    [self.airbnbRequest retrieveSearchWithCompletion:^(NSArray <Search *> * searches, NSDictionary *userInfo) {
        __strong typeof (self) strongSelf = weakSelf;
        strongSelf.entries = searches;
        [strongSelf.tableView reloadData];
    }];
}

- (NSDictionary *)requestParamsForClientId:(NSString *)client_id locale:(NSString *)locale currency:(NSString *)currency format:(NSString *)format limit:(NSNumber *)limit offset:(NSNumber *)offset fetch_facets:(NSNumber *)fetch_facets guests:(NSNumber *)guests ib:(NSNumber *)ib ib_add_photo_flow:(NSNumber *)ib_add_photo_flow location:(NSString *)location min_bathrooms:(NSNumber *)min_bathrooms min_bedrooms:(NSNumber *)min_bedrooms min_num_pic_urls:(NSNumber *)min_num_pic_urls price_max:(NSNumber *)price_max price_min:(NSNumber *)price_min sort:(NSNumber *)sort user_lat:(NSNumber *)user_lat user_lng:(NSNumber *)user_lng {
    return @{
             @"client_id" : client_id ? : @"",
             @"locale" : locale ? : @"",
             @"currency" : currency ? : @"",
             @"_format" : format ? : @"",
             @"_limit" : limit ? : @"",
             @"_offset" : offset ? : @"",
             @"fetch_facets" : fetch_facets ? : @"",
             @"guests" : guests ? : @"",
             @"ib" : ib ? : @"",
             @"ib_add_photo_flow" : ib_add_photo_flow ? : @"",
             @"location" : locale ? : @"",
             @"min_bathrooms" : min_bathrooms ? : @"",
             @"min_bedrooms" : min_bedrooms ? : @"",
             @"min_num_pic_urls" : min_num_pic_urls ? : @"",
             @"price_max" : price_max ? : @"",
             @"price_min" : price_min ? : @"",
             @"sort" : sort ? : @"",
             @"user_lat" : user_lat ? : @"",
             @"user_lng" : user_lng ? : @""
             };
}

- (void)configureCell:(ListingTableCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    Search * search = self.entries[indexPath.row];
    Listing * listing = search.listing;
    Pricing * pricing = search.pricing;
    
    [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:listing.picture_url]];
    [cell.userImageView sd_setImageWithURL:[NSURL URLWithString:listing.user.picture_url]];
    cell.favouriteImageView.alpha = .5f;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:pricing.currency];
    NSString * currency = [locale displayNameForKey:NSLocaleCurrencySymbol value:pricing.currency] ? : pricing.currency;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@%@", currency, pricing.amount];
    cell.nameLabel.text = listing.name;
    cell.descriptionLabel.text = [NSString stringWithFormat:@"%@ Reviews - %@", listing.reviews_count ? : 0, listing.room_type_category];
}

- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath {
    static NSString * const kListingTableCell = @"ListingTableCell";
    return kListingTableCell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (CGRectGetHeight(tableView.frame) - CGRectGetHeight(self.navigationController.navigationBar.frame) - CGRectGetHeight(self.tabBarController.tabBar.frame)) / 2;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    }
}

#pragma mark - Getters

- (AirbnbRequest *)airbnbRequest {
    if(!_airbnbRequest) {
        _airbnbRequest = [AirbnbRequest new];
        _airbnbRequest.retries = 0;
    }
    return _airbnbRequest;
}

@end