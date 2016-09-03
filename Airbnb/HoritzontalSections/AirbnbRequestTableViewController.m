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

static NSString * const kEndpoint = @"http://airbnb.com/...";

typedef NS_ENUM(NSUInteger, TableViewSection) {
    TableViewSectionSearches,
    TableViewSectionCities,
    TableViewSectionPopular,
    TableViewSectionGuidebooks,
    TableViewSectionOther
};

static NSString * const myCollectionCellID = @"MyCollectionCellID";

//static NSString * const cellIdentifiers[] = {
//    @"CellIdentifierSearches",
//    @"CellIdentifierCities",
//    @"CellIdentifierPopular",
//    @"CellIdentifierGuidebooks",
//    @"CellIdentifierOther"
//};

@interface AirbnbRequestTableViewController ()

@property (nonatomic, strong) AirbnbRequest * airbnbRequest;
@property (nonatomic, strong) NSURLSessionDataTask * downloadTask;

@property (nonatomic, strong) NSMutableArray * cities;
@property (nonatomic, strong) NSMutableArray * locations;
@property (nonatomic, strong) NSMutableArray * rooms;

@end

@implementation AirbnbRequestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    [self.downloadTask cancel];
     
    NSURL * url = [NSURL URLWithString:kEndpoint];
    
    __weak typeof (self) weakSelf = self;
                         
    self.downloadTask = [self.airbnbRequest retrieveDataForUrl:url completionBlock:^(Airbnb * airbnb, NSDictionary *userInfo) {
        
        __strong typeof (self) strongSelf = weakSelf;
        
        strongSelf.entries = @[];
        
        [strongSelf.tableView reloadData];
    }];
    */
    
    NSDictionary * mock = [DataMock mock];
    //    NSDictionary * meta = [mock objectForKey:@"meta"];
    NSDictionary * content = [mock objectForKey:@"content"];
    
    if(content) {
        
        _cities = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"cities"]];
        _locations = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"locations"]];
        _rooms = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"rooms"]];
        
        self.entries = @[self.cities, self.locations, self.rooms];
    }
}

- (void)configureCollectionViewCell:(AirbnbCollectionViewCell *)cell atIndex:(NSUInteger)index indexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
    
    NSObject * object = self.entries[index][indexPath.row];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[object valueForKeyPath:@"url"]]];
    
    switch (index) {
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
    
    cell.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:.6];
}

- (NSString *)collectionView:(AirbnbCollectionView *)collectionView cellIdentifierAtIndex:(NSUInteger)index {
    return myCollectionCellID;
//    return cellIdentifiers[index];
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
