//
//  AirbnbRequestTableViewController.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "AirbnbRequestTableViewController.h"
#import "AirbnbCollectionView.h"
#import "AirbnbCollectionViewCell.h"
#import "AirbnbRequest.h"
#import "Airbnb.h"
#import "DataMock.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString * const kEndpoint = @"https://api.airbnb.com/v2/search_results";

//typedef NS_ENUM(NSUInteger, TableViewSection) {
//    TableViewSectionListings,
//    TableViewSectionSearches,
//    TableViewSectionCities,
//    TableViewSectionPopular,
//    TableViewSectionGuidebooks,
//    TableViewSectionOther
//};

static NSString * const myCollectionCellID = @"MyCollectionCellID";

//static NSString * const cellIdentifiers[] = {
//    @"TableViewSectionListings",
//    @"CellIdentifierSearches",
//    @"CellIdentifierCities",
//    @"CellIdentifierPopular",
//    @"CellIdentifierGuidebooks",
//    @"CellIdentifierOther"
//};

@interface AirbnbRequestTableViewController ()

@property (nonatomic, strong) AirbnbRequest * airbnbRequest;
@property (nonatomic, strong) NSURLSessionDataTask * downloadTask;
@property (nonatomic, strong) NSMutableArray * listings;
//@property (nonatomic, strong) NSMutableArray * cities;
//@property (nonatomic, strong) NSMutableArray * locations;
//@property (nonatomic, strong) NSMutableArray * rooms;

@end

@implementation AirbnbRequestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL * url = [NSURL URLWithString:kEndpoint];
    
    __weak typeof (self) weakSelf = self;
    
    self.airbnbRequest.url = url;
    self.airbnbRequest.parameters = [self requestParamsForClientId:@"3092nxybyb0otqw18e8nh5nty" locale:@"en-US" currency:@"USD" format:@"for_search_results_with_minimal_pricing" limit:@(20) offset:@(0) fetch_facets:@(true) guests:@(1) ib:@(false) ib_add_photo_flow:@(true) location:@"Lake%20Tahoe%2C%20CA%2C%20US" min_bathrooms:@(0) min_bedrooms:@(0) min_num_pic_urls:@(10) price_max:@(210) price_min:@(40) sort:@(1) user_lat:@(37.3398634) user_lng:@(-122.0455164)];
    
    self.downloadTask = [self.airbnbRequest retrieveListingWithCompletion:^(NSArray <Listing *> * listings, NSDictionary *userInfo) {
        
        __strong typeof (self) strongSelf = weakSelf;
        
        strongSelf.entries = listings;
//        strongSelf.listings = [[NSMutableArray alloc] initWithArray:listings];
//        strongSelf.entries = @[self.listings, self.cities, self.locations, self.rooms];
        
        [strongSelf.tableView reloadData];
    }];
    
    /*
    NSDictionary * mock = [DataMock mock];
    //    NSDictionary * meta = [mock objectForKey:@"meta"];
    NSDictionary * content = [mock objectForKey:@"content"];
    
    if(content) {
        
        _cities = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"cities"]];
        _locations = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"locations"]];
        _rooms = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"rooms"]];
        
        self.entries = @[self.cities, self.locations, self.rooms];
    }
    */
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
    
    /*
    'location' => 'New York, NY, United States',
    'user_lng' => -73.98530667330833,
    'user_lat' => 40.75268419028417,
    'currency' => 'USD',
    'ib' => TRUE,
    'ib_add_photo_flow' => TRUE,
    'suppress_facets' => TRUE,
    'room_types[]' => 'private_room',
    'room_types[]' => 'shared_room',
    'room_types[]' => 'entire_home',
    'amenities[]' => 1,
    'amenities[]' => 2,
    'amenities[]' => 3,
    'price_min'	=> 267,
    'price_max' => 872,
    'checkin' => '2015-12-29',
    'checkout' => '2016-01-19',
    'guests' => 2,
    'sort' => 0,
    '_offset' => 0,
    '_format' => 'for_search_results_with_minimal_pricing',
    '_limit' => 20,
    'min_num_pic_urls' => 10,
    )
    */
}

- (void)configureCollectionViewCell:(AirbnbCollectionViewCell *)cell atIndex:(NSUInteger)index indexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
  
    Listing * listing = self.entries[index];
    NSString * image = listing.picture_urls[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image]];
    
    /*
    NSObject * object = self.entries[index][indexPath.row];
    
    NSLog(@"object -> %@", object);
    
    NSString * image;
    
    switch (index) {
            
        case TableViewSectionListings: {
     
        }
            break;
            
        case TableViewSectionSearches:
        {
            
        }
            break;
            
        case TableViewSectionCities:
        {
            
        }
            break;
            
        case TableViewSectionPopular:
        {
            
        }
            break;
            
        case TableViewSectionGuidebooks:
        {
            
        }
            break;
    }
    
    NSURL * url = [NSURL URLWithString:image];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[object valueForKeyPath:@"url"]]];
    */
    
    cell.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.6];
}

- (NSString *)collectionView:(AirbnbCollectionView *)collectionView cellIdentifierAtIndex:(NSUInteger)index {
    return myCollectionCellID;
//    return cellIdentifiers[index];
}

- (NSInteger)collectionView:(AirbnbCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSUInteger index = collectionView.index;
    return ((Listing *)self.entries[index]).picture_urls.count;
}

#pragma mark - Getters

- (AirbnbRequest *)airbnbRequest {
    if(!_airbnbRequest) {
        _airbnbRequest = [AirbnbRequest new];
        _airbnbRequest.retries = 0;
        _airbnbRequest.userAgent = @"";
    }
    return _airbnbRequest;
}

@end
