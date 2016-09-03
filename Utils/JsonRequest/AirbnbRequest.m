//
//  AirbnbRequest.m
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "AirbnbRequest.h"
#import "Airbnb.h"

static NSString * const kEntriesKey = @"entries";
static NSString * const kRoomsKey = @"rooms";
static NSString * const kCitiesKey = @"cities";

@interface AirbnbRequest ()

@end

@implementation AirbnbRequest

//- (NSURLSessionDataTask *)retrieveDataWithCompletion:(RequestResultBlock)completion {
//    return [super retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
//        completion([self linstingFromJson:result], userInfo);
//    }];
//}

- (NSURLSessionDataTask *)retrieveSearchWithCompletion:(RequestResultBlock)completion {
    return [self retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
        completion([self searchFromJson:result], userInfo);
    }];
}

- (NSURLSessionDataTask *)retrieveListingWithCompletion:(RequestResultBlock)completion {
    return [self retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
        completion([self linstingFromJson:result], userInfo);
    }];
}

- (NSURLSessionDataTask *)retrievePricingWithCompletion:(RequestResultBlock)completion {
    return [self retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
        completion([self linstingFromJson:result], userInfo);
    }];
}

- (NSArray <Search *> *)searchFromJson:(NSDictionary *)json {
    
    NSLog(@"json -> %@", json);
    
    if(![json isKindOfClass:[NSDictionary class]]) {return nil;}
    
    NSArray * search_results = [json objectForKey:@"search_results"];
    
    NSMutableArray * searches = [NSMutableArray new];
    for(NSDictionary * dictionary in search_results) {
        Search * search = [[Search alloc] initWithDictionary:dictionary];
        [searches addObject:search];
    }
    
    return [NSArray arrayWithArray:searches];
}

- (NSArray <Listing *> *)linstingFromJson:(NSDictionary *)json {
    
    NSLog(@"json -> %@", json);
    
    if(![json isKindOfClass:[NSDictionary class]]) {return nil;}
    
    NSArray * search_results = [json objectForKey:@"search_results"];
    
    NSMutableArray * listings = [NSMutableArray new];
    for(NSDictionary * dictionary in search_results) {
        NSDictionary * listing = [dictionary objectForKey:@"listing"];
        [listings addObject:[[Listing alloc] initWithDictionary:listing]];
    }
    
    return [NSArray arrayWithArray:listings];
}

- (NSArray <Listing *> *)pricingFromJson:(NSDictionary *)json {
    
    NSLog(@"json -> %@", json);
    
    if(![json isKindOfClass:[NSDictionary class]]) {return nil;}
    
    NSArray * search_results = [json objectForKey:@"search_results"];
    
    NSMutableArray * pricings = [NSMutableArray new];
    for(NSDictionary * dictionary in search_results) {
        NSDictionary * listing = [dictionary objectForKey:@"pricing_quote"];
        [pricings addObject:[[Listing alloc] initWithDictionary:listing]];
    }
    
    return [NSArray arrayWithArray:pricings];
}

@end
