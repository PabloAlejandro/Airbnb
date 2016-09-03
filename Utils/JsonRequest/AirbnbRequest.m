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

- (NSURLSessionDataTask *)retrieveDataWithCompletion:(RequestResultBlock)completion
{
    return [super retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
        completion([self airbnbFromJson:result], userInfo);
    }];
}

- (Airbnb *)airbnbFromJson:(NSDictionary *)json
{
    NSLog(@"json -> %@", json);
    
    Airbnb * airbnb = nil;
    
    if([json isKindOfClass:[NSDictionary class]]) {
        
        NSMutableArray * rooms_mutable = [NSMutableArray new];
        NSMutableArray * cities_mutable = [NSMutableArray new];
        
        NSDictionary * airbnbDict = (NSDictionary *)[json objectForKey:kEntriesKey];
        
        NSArray * rooms = [airbnbDict objectForKey:kRoomsKey];
        
        for(NSDictionary * roomDict in rooms) {
            Room * room = [self roomFromJson:roomDict];
            [rooms_mutable addObject:room];
        }
        
        NSArray * cities = [airbnbDict objectForKey:kCitiesKey];
        
        for(NSDictionary * cityDict in cities) {
            City * city = [self cityFromJson:cityDict];
            [cities_mutable addObject:city];
        }
        
        airbnb.rooms = [NSArray arrayWithArray:rooms_mutable];
        airbnb.cities = [NSArray arrayWithArray:cities_mutable];
    }
    
    return airbnb;
}

- (Room *)roomFromJson:(NSDictionary *)json {
    Room * room = [Room new];
    room.room_id = [json objectForKey:@"id"];
    room.title = [json objectForKey:@"title"];
    room.userName = [json objectForKey:@"user_name"];
    room.information = [json objectForKey:@"information"];
    room.image_url = [json objectForKey:@"image_url"];
    room.user_image_url = [json objectForKey:@"user_image_url"];
    room.dollars = [json objectForKey:@"dollars"];
    room.rate = [json objectForKey:@"rate"];
    room.favourite = [json objectForKey:@"favourite"];
    return room;
}

- (City *)cityFromJson:(NSDictionary *)json {
    City * city = [City new];
    city.city_id = [json objectForKey:@"id"];
    city.title = [json objectForKey:@"title"];
    city.information = [json objectForKey:@"information"];
    return city;
}

#pragma mark - Public

- (NSURLSessionDataTask *)retrieveDataType:(AirbnbDataType)dataType WithCompletion:(RequestResultBlock)completion {
    return [super retrieveDataWithCompletion:^(id result, NSDictionary *userInfo) {
        
        switch (dataType) {
            case AirbnbDataTypeAirbnb:
                completion([self airbnbFromJson:result], userInfo);
                break;
            
            case AirbnbDataTypeCity:
                completion([self airbnbFromJson:result], userInfo);
                break;
            
            case AirbnbDataTypeRoom:
                completion([self airbnbFromJson:result], userInfo);
                break;
                
            default:
                completion(nil, userInfo);
                break;
        }
    }];
}

@end
