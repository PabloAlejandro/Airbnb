//
//  NSUserDefaults+Utils.m
//  Search
//
//  Created by Pau on 03/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "NSUserDefaults+Utils.h"

@implementation NSUserDefaults (Utils)

+ (id)getObjectProperty:(const NSString *)propertyName orDefault:(id)defaultValue {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id property = [defaults objectForKey:(NSString *)propertyName];
    return property != nil ? property : defaultValue;
}

+ (void)setObjectProperty:(const NSString *)propertyName value:(id)value {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:(NSString *)propertyName];
    [defaults synchronize];
}

@end
