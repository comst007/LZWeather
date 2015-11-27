//
//  LZForecastWeatherView.h
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZForecastWeatherView : UIView
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *cityName;

- (void)buildview;

- (void)show;

- (void)hide;
@end
