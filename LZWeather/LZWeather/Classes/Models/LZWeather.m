//
//  LZWeather.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWeather.h"

@implementation LZWeather

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }else if ([key isEqualToString:@"id"]) {
        self.weatherID = value;
    }else{
        return;
    }
}
@end
