//
//  Airbnb.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Airbnb, City, Room, Search;

@interface Airbnb : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSArray <Room *> * rooms;
@property (nonatomic, copy) NSArray <City *> * cities;

@end


@interface City : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString * city_id;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * information;
@property (nonatomic, strong) NSURL * image_url;

@end


@interface Room : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString * room_id;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * userName;
@property (nonatomic, copy) NSString * information;
@property (nonatomic, strong) NSURL * image_url;
@property (nonatomic, strong) NSURL * user_image_url;
@property (nonatomic, strong) NSNumber * dollars;
@property (nonatomic, strong) NSNumber * rate;
@property (nonatomic, strong, getter=isFavourite) NSNumber * favourite;

@end


@interface Search : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * details;

@end