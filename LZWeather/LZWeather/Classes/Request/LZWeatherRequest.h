//
//  LZWeatherRequest.h
//  LZWeather
//
//  Created by comst on 15/11/12.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LZWeatherRequest;

typedef void (^weatherCompletionHandler)(LZWeatherRequest *request);

@interface LZWeatherRequest : NSObject

@property (nonatomic, strong) NSError *error;
- (void)weatherRequestWithArgDic:(NSDictionary *)argDic completionHandler:(weatherCompletionHandler)handler;


@end
