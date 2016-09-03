//
//  DataMock.m
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "DataMock.h"

@implementation DataMock

+ (NSDictionary *)mock {

    return @{
             @"meta" : @{
                     @"status" : @"",
                     @"code" : @(200)
                     },
             
             @"content" : @{
                     
                     @"cities" : @[
                             
                             @{
                                 @"id" : @"id city 1",
                                 @"name" : @"Barcelona",
                                 @"url" : @"http://2015.phpconference.es/wp-content/uploads/2015/05/barcelona1.jpg"
                                 },
                             @{
                                 @"id" : @"id city 2",
                                 @"name" : @"London",
                                 @"url" : @"https://media.timeout.com/images/100644443/image.jpg"
                                 },
                             @{
                                 @"id" : @"id city 3",
                                 @"name" : @"San Francisco",
                                 @"url" : @"http://qlikdevgroup.com/wp-content/uploads/SanFransisco.jpg"
                                 },
                             @{
                                 @"id" : @"id city 4",
                                 @"name" : @"New York",
                                 @"url" : @"http://www.globalacademicinstitute.com/wp-content/uploads/photo-gallery/new_york_skyline-wide.jpg"
                                 },
                             @{
                                 @"id" : @"id city 5",
                                 @"name" : @"Tokio",
                                 @"url" : @"http://www.urlaubfotos.com/wp-content/uploads/2016/07/tokio-6.jpg"
                                 }
                             ],
                     @"locations" : @[
                             
                             @{
                                 @"id" : @"id location 1",
                                 @"name" : @"Barcelona",
                                 @"url" : @"http://2015.phpconference.es/wp-content/uploads/2015/05/barcelona1.jpg"
                                 },
                             @{
                                 @"id" : @"id location 2",
                                 @"name" : @"London",
                                 @"url" : @"https://media.timeout.com/images/100644443/image.jpg"
                                 },
                             @{
                                 @"id" : @"id location 3",
                                 @"name" : @"San Francisco",
                                 @"url" : @"http://qlikdevgroup.com/wp-content/uploads/SanFransisco.jpg"
                                 },
                             @{
                                 @"id" : @"id location 4",
                                 @"name" : @"New York",
                                 @"url" : @"http://www.globalacademicinstitute.com/wp-content/uploads/photo-gallery/new_york_skyline-wide.jpg"
                                 },
                             @{
                                 @"id" : @"id location 5",
                                 @"name" : @"Tokio",
                                 @"url" : @"http://www.urlaubfotos.com/wp-content/uploads/2016/07/tokio-6.jpg"
                                 }
                             ],
                     
                     @"rooms" : @[
                             @{
                                 @"id" : @"id room 1",
                                 @"title" : @"room 1",
                                 @"description" : @"Description room 1",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 1",
                                 @"user_url" : @"http://..."
                                 },
                             @{
                                 @"id" : @"id room 2",
                                 @"title" : @"room 2",
                                 @"description" : @"Description room 2",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 2",
                                 @"user_url" : @"http://..."
                                 },
                             @{
                                 @"id" : @"id room 3",
                                 @"title" : @"room 3",
                                 @"description" : @"Description room 3",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 3",
                                 @"user_url" : @"http://..."
                                 },
                             @{
                                 @"id" : @"id room 3",
                                 @"title" : @"room 3",
                                 @"description" : @"Description room 3",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 3",
                                 @"user_url" : @"http://..."
                                 },
                             @{
                                 @"id" : @"id room 4",
                                 @"title" : @"room 4",
                                 @"description" : @"Description room 4",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 4",
                                 @"user_url" : @"http://..."
                                 },
                             @{
                                 @"id" : @"id room 5",
                                 @"title" : @"room 5",
                                 @"description" : @"Description room 5",
                                 @"url" : @"http://...",
                                 @"stars" : @(5.0),
                                 @"user_name" : @"user 5",
                                 @"user_url" : @"http://..."
                                 }
                             ]
                     }
             };
}

@end
