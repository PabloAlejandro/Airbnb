//
//  NSUserDefaults+Utils.h
//  Search
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Utils)

+ (id)getObjectProperty:(const NSString *)propertyName orDefault:(id)defaultValue;
+ (void)setObjectProperty:(const NSString *)propertyName value:(id)value;

@end
