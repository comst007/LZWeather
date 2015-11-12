//
//  LZCity.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZCity.h"

@implementation LZCity

- (void)setValue:(id)value forKey:(NSString *)key{
    
    if ([key isEqualToString:@"coord"]) {
        
        self.coord = [[LZCoord alloc] init];
        [self.coord setValuesForKeysWithDictionary:value];
        return;
    }
    if ([key isEqualToString:@"id"]) {
        self.cityID = value;
        return;
    }
    if ([key isEqualToString:@"population"]) {
        return;
    }
    
    [super setValue:value forKey:key];
    
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
