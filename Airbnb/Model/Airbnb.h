//
//  Airbnb.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Listing, User, Pricing, Search, Recent;

@interface Search : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) Listing * listing;
@property (nonatomic, strong) Pricing * pricing;
@property (nonatomic, strong) NSDate * viewed_at;

@end


@interface Listing : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSNumber * airbnb_plus_enabled;
@property (nonatomic, strong) NSNumber * bathrooms;
@property (nonatomic, strong) NSNumber * bedrooms;
@property (nonatomic, strong) NSNumber * beds;
@property (nonatomic, copy) NSString * city;
@property (nonatomic, strong) NSNumber * coworker_hosted;
@property (nonatomic, strong) NSNumber * distance;
@property (nonatomic, copy) NSArray <NSString *> * extra_host_languages;
@property (nonatomic, strong) NSNumber * id_listing;
@property (nonatomic, strong) NSNumber * instant_bookable;
@property (nonatomic, strong) NSNumber * is_business_travel_ready;
@property (nonatomic, strong) NSNumber * is_new_listing;
@property (nonatomic, strong) NSNumber * lat;
@property (nonatomic, copy) NSArray <NSString *> * listing_tags;
@property (nonatomic, strong) NSNumber * lng;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * neighborhood;
@property (nonatomic, strong) NSNumber * person_capacity;
@property (nonatomic, strong) NSNumber * picture_count;
@property (nonatomic, copy) NSString * picture_url;
@property (nonatomic, copy) NSArray <NSString *> * picture_urls;
@property (nonatomic, strong) User * primary_host;
@property (nonatomic, copy) NSString * property_type;
@property (nonatomic, strong) NSNumber * property_type_id;
@property (nonatomic, copy) NSString * public_address;
@property (nonatomic, strong) NSNumber * reviews_count;
@property (nonatomic, copy) NSString * room_type;
@property (nonatomic, copy) NSString * room_type_category;
@property (nonatomic, strong) NSNumber * star_rating;
@property (nonatomic, copy) NSString * thumbnail_url;
@property (nonatomic, strong) User * user;
@property (nonatomic, strong) NSNumber * user_id;
@property (nonatomic, copy) NSString * xl_picture_url;
@property (nonatomic, copy) NSArray <NSString *> * xl_picture_urls;

@end


@interface User : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString * first_name;
@property (nonatomic, strong) NSNumber * has_profile_pic;
@property (nonatomic, strong) NSNumber * id_user;
@property (nonatomic, copy) NSString * picture_url;
@property (nonatomic, copy) NSString * smart_name;
@property (nonatomic, copy) NSString * thumbnail_url;
@property (nonatomic, strong) NSNumber * is_superhost;

@end


@interface Pricing : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSNumber * available;
@property (nonatomic, strong) NSNumber * can_instant_book;
@property (nonatomic, strong) NSDate * check_in;
@property (nonatomic, strong) NSDate * check_out;
@property (nonatomic, strong) NSNumber * guests;
@property (nonatomic, strong) NSNumber * number_of_adults;
@property (nonatomic, strong) NSNumber * number_of_children;
@property (nonatomic, strong) NSNumber * number_of_infants;
@property (nonatomic, strong) NSNumber * price;
@property (nonatomic, strong) NSNumber * amount;
@property (nonatomic, copy) NSString * currency;
@property (nonatomic, copy) NSString * rate_type;

@end


@interface Recent : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * details;

@end