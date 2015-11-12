//
//  LZWeatherInfo.m
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import "LZWeatherInfo.h"

@implementation LZWeatherInfo



- (instancetype)initWithDic:(NSDictionary *)dict{
    
    self = [super init];
    if (self) {
        self.coord = [[LZCoord alloc] init];
        [self.coord setValuesForKeysWithDictionary:dict[@"coord"]];
        self.weather = [[LZWeather alloc] init];
        [self.weather setValuesForKeysWithDictionary:[dict[@"weather"] firstObject]];
        
        self.base = dict[@"base"];
        self.weatherMain = [[LZMain alloc] init];
        
        [self.weatherMain setValuesForKeysWithDictionary:dict[@"main"]];
        self.visibility = dict[@"visibility"];
        self.wind = [[LZWind alloc] init];
        
        [self.wind setValuesForKeysWithDictionary:dict[@"wind"]];
        
        self.clouds = [[LZClouds alloc] init];
        
        [self.clouds setValuesForKeysWithDictionary:dict[@"clouds"]];
        
        self.dt = dict[@"dt"];
        self.sys = [[LZSys alloc] init];
        [self.sys setValuesForKeysWithDictionary:dict[@"sys"]];
        self.cityID = dict[@"id"];
        self.cityName = dict[@"name"];
        self.cod = dict[@"cod"];
        
    }
    
    
    return self;
    
   
}
@end
