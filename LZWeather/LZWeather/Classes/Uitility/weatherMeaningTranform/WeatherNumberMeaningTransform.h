//
//  WeatherNumberMeaningTransform.h
//  YXMWeather
//
//  Created by XianMingYou on 15/3/4.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZEmitterLayerView.h"

@interface WeatherNumberMeaningTransform : NSObject

+ (NSString *)fontTextWeatherNumber:(NSNumber *)number;
+ (UIColor *)iconColor:(NSNumber *)number;
+ (EMitterType)emitterTypeWithNumber:(NSNumber *)number;

@end
