//
//  LZGlobal.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZWeatherInfo.h"
#import "LZForecastInfo.h"
@interface LZGlobal : NSObject

@property (nonatomic, strong) LZWeatherInfo *weatherInfo;
@property (nonatomic, strong) LZForecastInfo *forecastInfo;
+ (instancetype)sharedGlobal;

@end
