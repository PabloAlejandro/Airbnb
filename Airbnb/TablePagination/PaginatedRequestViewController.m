//
//  PaginatedRequestViewController.m
//  Airbnb
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "PaginatedRequestViewController.h"
#import "AirbnbRequest.h"

static NSInteger const perpage = 50;
static NSString * const baseURL = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736&per_page=%lu&page=%lu&format=json&nojsoncallback=1&safe_search=1&text=%@";

@interface PaginatedRequestViewController ()

@property (nonatomic, strong) AirbnbRequest * airbnbRequest;
@property (nonatomic, strong) NSURLSessionDataTask * downloadTask;
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) BOOL downloading;

@end

@implementation PaginatedRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.entries = @[
                     @"Item 1",
                     @"Item 2",
                     @"Item 3",
                     @"Item 4",
                     @"Item 5",
                     @"Item 6",
                     @"Item 7",
                     @"Item 8",
                     @"Item 9",
                     @"Item 10",
                     @"Item 11",
                     @"Item 12",
                     @"Item 13",
                     @"Item 14",
                     @"Item 15",
                     @"Item 16",
                     @"Item 17",
                     @"Item 18",
                     @"Item 19"
                     ];
}

- (void)tableViewShouldLoadMoreEntries {
    
    if(self.downloading) {return;}
    
    self.downloading = true;
    
    [self.downloadTask cancel];
    
    NSString * string = @"San Francisco";
    NSCharacterSet * characterSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString * urlStr = [[NSString stringWithFormat:baseURL, perpage, self.page, string] stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    NSLog(@"%s url -> %@ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!", __func__, url);
    
    __weak typeof (self) weakSelf = self;
    
//    self.airbnbRequest.parameters = @{@"page" : @(self.page)};
    self.downloadTask = [self.airbnbRequest retrieveDataForUrl:url completionBlock:^(id objects, NSDictionary *userInfo) {
        
        NSLog(@"objects -> %@", objects);
        
        __strong typeof (self) strongSelf = weakSelf;
        
        if([objects isKindOfClass:[NSArray class]]) {
            strongSelf.entries = [strongSelf.entries arrayByAddingObjectsFromArray:objects];
            [strongSelf.tableView reloadData];
            strongSelf.page++;
        }
        
        strongSelf.downloading = false;
    }];
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
