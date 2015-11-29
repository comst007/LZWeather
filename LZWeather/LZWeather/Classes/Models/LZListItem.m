//
//  LZListItem.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZListItem.h"

@implementation LZListItem
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"temp"]) {
        self.temp = [[LZTemp alloc] init];
        [self.temp setValuesForKeysWithDictionary:value];
        return;
    }
    if ([key isEqualToString:@"weather"]) {
        self.weather = [[LZWeather alloc] init];
        [self.weather setValuesForKeysWithDictionary:[value firstObject]];
        return;
    }
    if ([key isEqualToString:@"dt"]) {
        
        [super setValue:value forKey:key];
    }
    
    
}

@end
