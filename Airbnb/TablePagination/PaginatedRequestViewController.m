//
//  PaginatedRequestViewController.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "PaginatedRequestViewController.h"
#import "AirbnbRequest.h"
#import "Airbnb.h"

static NSString * const kEndpoint = @"https://api.airbnb.com/v2/search_results";

@interface PaginatedRequestViewController ()

@property (nonatomic, strong) AirbnbRequest * airbnbRequest;
@property (nonatomic, strong) NSURLSessionDataTask * downloadTask;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) BOOL downloading;

@end

@implementation PaginatedRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.entries = [NSArray new];
    
    [self tableViewShouldLoadMoreEntries];
}

- (void)tableViewShouldLoadMoreEntries {
    
    if(self.downloading) {return;}
    
    [self.activityIndicator startAnimating];
    self.downloading = true;
    
    [self.downloadTask cancel];
    
    NSURL * url = [NSURL URLWithString:kEndpoint];
    
    self.airbnbRequest.url = url;
    self.airbnbRequest.parameters = [self requestParamsForClientId:@"3092nxybyb0otqw18e8nh5nty" locale:@"en-US" currency:@"USD" format:@"for_search_results_with_minimal_pricing" limit:@(20) offset:@(0) fetch_facets:@(true) guests:@(1) ib:@(false) ib_add_photo_flow:@(true) location:@"Lake%20Tahoe%2C%20CA%2C%20US" min_bathrooms:@(0) min_bedrooms:@(0) min_num_pic_urls:@(10) price_max:@(210) price_min:@(40) sort:@(1) user_lat:@(37.3398634) user_lng:@(-122.0455164)];
    
    __weak typeof (self) weakSelf = self;
    self.downloadTask = [self.airbnbRequest retrieveSearchWithCompletion:^(NSArray <Search *> * searches, NSDictionary *userInfo) {
        __strong typeof (self) strongSelf = weakSelf;
        strongSelf.downloading = false;
        strongSelf.entries = [strongSelf.entries arrayByAddingObjectsFromArray:searches];
        [strongSelf.tableView reloadData];
        [strongSelf.activityIndicator stopAnimating];
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

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    Search * search = self.entries[indexPath.row];
    Listing * listing = search.listing;
    Pricing * pricing = search.pricing;
    
    cell.textLabel.text = listing.name;
    cell.detailTextLabel.text = listing.name;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:pricing.currency];
    NSString * currency = [locale displayNameForKey:NSLocaleCurrencySymbol value:pricing.currency] ? : pricing.currency;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@", currency, pricing.amount];
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
