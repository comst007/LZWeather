//
//  LZForecastRequest.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZForecastInfo.h"
@class LZForecastRequest;

typedef void (^forecastRequestCompletionHandler)(LZForecastRequest *request);
@interface LZForecastRequest : NSObject

@property (nonatomic, strong) NSError *error;

- (void)forecastRequestWithArgDic:(NSDictionary *)argDic completionHandler:(forecastRequestCompletionHandler)handler;

@end
