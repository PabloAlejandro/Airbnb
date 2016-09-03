//
//  JsonRequestRetry.h
//  Airbnb
//
//  Created by Pablo Alejandro Perez Martinez on 01/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ServerRequestUtils.h"

typedef void(^RequestResultBlock)(id result, NSDictionary * userInfo);

@interface JsonRequestRetry : NSObject

- (id)initWithUrl:(NSURL *)url;
- (id)initWithUrl:(NSURL *)url parameters:(NSDictionary *)parameters httpHeaderFields:(NSDictionary *)httpHeaderFields method:(HTTP_METHOD)method referer:(NSURL *)referer requestKey:(NSString *)requestKey requestSecretKey:(NSString *)requestSecretKey userAgent:(NSString *)userAgent data:(NSData *)data userToken:(NSString *)userToken NS_DESIGNATED_INITIALIZER;

- (NSURLSessionDataTask *)retrieveDataWithCompletion:(RequestResultBlock)completion;
- (NSURLSessionDataTask *)retrieveDataForUrl:(NSURL *)url completionBlock:(RequestResultBlock)completion;

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSDictionary *httpHeaderFields;
@property (nonatomic) HTTP_METHOD method;
@property (nonatomic, strong) NSURL *referer;
@property (nonatomic, copy) NSString *requestKey;
@property (nonatomic, copy) NSString *requestSecretKey;
@property (nonatomic, copy) NSString *userAgent;
@property (nonatomic, strong) NSData *data;
@property (nonatomic, copy) NSString *userToken;
@property (nonatomic, copy) RequestResultBlock completion;
@property (nonatomic, assign) NSUInteger retries;

/**
 * Timeout for requests
 */
@property (nonatomic, assign) CGFloat timeout;

@end
