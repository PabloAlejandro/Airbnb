//
//  Airbnb.m
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "Airbnb.h"

@implementation Listing

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        
        _airbnb_plus_enabled = [dictionary objectForKey:@"airbnb_plus_enabled"];
        _bathrooms = [dictionary objectForKey:@"bathrooms"];
        _bedrooms = [dictionary objectForKey:@"bedrooms"];
        _beds = [dictionary objectForKey:@"beds"];
        _city = [dictionary objectForKey:@"city"];
        _coworker_hosted = [dictionary objectForKey:@"coworker_hosted"];
        _distance = [dictionary objectForKey:@"distance"];
        _extra_host_languages = [dictionary objectForKey:@"extra_host_languages"];
        _id_listing = [dictionary objectForKey:@"id_listing"];
        _instant_bookable = [dictionary objectForKey:@"instant_bookable"];
        _is_business_travel_ready = [dictionary objectForKey:@"is_business_travel_ready"];
        _is_new_listing = [dictionary objectForKey:@"is_new_listing"];
        _lat = [dictionary objectForKey:@"lat"];
        _listing_tags = [dictionary objectForKey:@"listing_tags"];
        _lng = [dictionary objectForKey:@"lng"];
        _name = [dictionary objectForKey:@"name"];
        _neighborhood = [dictionary objectForKey:@"neighborhood"];
        _person_capacity = [dictionary objectForKey:@"person_capacity"];
        _picture_count = [dictionary objectForKey:@"picture_count"];
        _picture_url = [dictionary objectForKey:@"picture_url"];
        _picture_urls = [dictionary objectForKey:@"picture_urls"];
        _primary_host = [[User alloc] initWithDictionary:[dictionary objectForKey:@"primary_host"]];
        _property_type = [dictionary objectForKey:@"property_type"];
        _property_type_id = [dictionary objectForKey:@"property_type_id"];
        _public_address = [dictionary objectForKey:@"public_address"];
        _reviews_count = [dictionary objectForKey:@"reviews_count"];
        _room_type = [dictionary objectForKey:@"room_type"];
        _room_type_category = [dictionary objectForKey:@"room_type_category"];
        _star_rating = [dictionary objectForKey:@"star_rating"];
        _thumbnail_url = [dictionary objectForKey:@"thumbnail_url"];
        _user = [[User alloc] initWithDictionary:[dictionary objectForKey:@"user"]];
        _user_id = [dictionary objectForKey:@"id"];
        _xl_picture_url = [dictionary objectForKey:@"xl_picture_url"];
        _xl_picture_urls = [dictionary objectForKey:@"xl_picture_urls"];
    }
    return self;
}

@end


@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        
        _first_name = [dictionary objectForKey:@"first_name"];
        _has_profile_pic = [dictionary objectForKey:@"has_profile_pic"];
        _id_user = [dictionary objectForKey:@"id"];
        _picture_url = [dictionary objectForKey:@"picture_url"];
        _smart_name = [dictionary objectForKey:@"smart_name"];
        _thumbnail_url = [dictionary objectForKey:@"thumbnail_url"];
        _is_superhost = [dictionary objectForKey:@"is_superhost"];
    }
    return self;
}

@end


@implementation Pricing

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if(self = [super init]) {
        
        _available = [dictionary objectForKey:@"available"];
        _can_instant_book = [dictionary objectForKey:@"can_instant_book"];
        _check_in = [dictionary objectForKey:@"check_in"];
        _check_out = [dictionary objectForKey:@"check_out"];
        _guests = [dictionary objectForKey:@"guests"];
        _number_of_adults = [dictionary objectForKey:@"number_of_adults"];
        _number_of_children = [dictionary objectForKey:@"number_of_children"];
        _number_of_infants = [dictionary objectForKey:@"number_of_infants"];
        _price = [dictionary objectForKey:@"price"];
        _amount = [dictionary objectForKey:@"amount"];
        _currency = [dictionary objectForKey:@"currency"];
        _rate_type = [dictionary objectForKey:@"rate_type"];
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