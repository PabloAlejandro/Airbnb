//
//  AirbnbRequest.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonRequestRetry.h"

typedef NS_ENUM(NSUInteger, AirbnbDataType) {
    AirbnbDataTypeAirbnb,
    AirbnbDataTypeCity,
    AirbnbDataTypeRoom
};

@interface AirbnbRequest : JsonRequestRetry

- (NSURLSessionDataTask *)retrieveDataType:(AirbnbDataType)dataType WithCompletion:(RequestResultBlock)completion;

@end
