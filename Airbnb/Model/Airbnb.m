//
//  Airbnb.m
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "Airbnb.h"

@implementation Airbnb

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
    
        NSMutableArray * mutableRooms = [NSMutableArray new];
        for(NSDictionary * room in [dictionary objectForKey:@"rooms"]) {
            [mutableRooms addObject:[[City alloc] initWithDictionary:room]];
        }
        
        NSMutableArray * mutableCities = [NSMutableArray new];
        for(NSDictionary * city in [dictionary objectForKey:@"cities"]) {
            [mutableCities addObject:[[City alloc] initWithDictionary:city]];
        }
        
        _rooms = [mutableCities copy];
        _cities = [mutableRooms copy];
    }
    return self;
}

@end


@implementation City

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        _city_id = [dictionary objectForKey:@"id"];
        _title = [dictionary objectForKey:@"name"];
        _information = [dictionary objectForKey:@"information"];
        _image_url = [dictionary objectForKey:@"url"];
    }
    return self;
}

@end


@implementation Room

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        _room_id = [dictionary objectForKey:@"id"];
        _title = [dictionary objectForKey:@"title"];
        _userName = [dictionary objectForKey:@"user_name"];
        _information = [dictionary objectForKey:@"information"];
        _image_url = [dictionary objectForKey:@"image_url"];
        _user_image_url = [dictionary objectForKey:@"user_image_url"];
        _dollars = [dictionary objectForKey:@"dollars"];
        _rate = [dictionary objectForKey:@"rate"];
        _favourite = [dictionary objectForKey:@"favourite"];
    }
    return self;
}

@end


@implementation Search

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        _title = [dictionary objectForKey:@"name"];
        _details = [dictionary objectForKey:@"details"];
    }
    return self;
}

@end