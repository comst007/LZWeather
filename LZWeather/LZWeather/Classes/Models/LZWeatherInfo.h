//
//  LZWeatherInfo.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZCoord.h"
#import "LZWeather.h"
#import "LZMain.h"
#import "LZWind.h"
#import "LZClouds.h"
#import "LZSys.h"
@interface LZWeatherInfo : NSObject

@property (nonatomic, strong) LZCoord *coord;

@property (nonatomic, strong) LZWeather *weather;
@property (nonatomic, copy) NSString *base;
@property (nonatomic, strong) LZMain *weatherMain;
@property (nonatomic, strong) NSNumber *visibility;
@property (nonatomic, strong) LZWind *wind;
@property (nonatomic, strong) LZClouds *clouds;
@property (nonatomic, strong) NSNumber *dt;
@property (nonatomic, strong) LZSys *sys;
@property (nonatomic, strong) NSNumber *cityID;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, strong) NSNumber  *cod;

- (instancetype)initWithDic:(NSDictionary *)dict;
@end
