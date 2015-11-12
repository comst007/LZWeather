//
//  LZForecastInfo.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZForecastInfo.h"

@implementation LZForecastInfo
- (void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"city"]) {
        self.city = [[LZCity alloc] init];
        [self.city setValuesForKeysWithDictionary:value];
        return;
    }
    if ([key isEqualToString:@"list"]) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in value) {
            LZListItem *item = [[LZListItem alloc] init];
            
            [item setValuesForKeysWithDictionary:dict];
            
            [arrayM addObject:item];
        }
        
        self.list = arrayM;
        
        return;
    }
    
    [super setValue:value forKey:key];
}
@end
