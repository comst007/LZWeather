
//
//  LZWeatherInfoView.h
//  LZWeather
//
//  Created by comst on 15/11/27.
//  Copyright (c) 2015年 com.comst1314. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZWeatherInfo.h"
#import "LZForecastInfo.h"

@class LZWeatherInfoView;
@protocol LZWeatherInfoViewProtocal <NSObject>

- (void) weatherInfoViewDidPullDownRefresh:(LZWeatherInfoView *)infoView;

- (void) weatherInfoViewDidPullUpLoadForecast:(LZWeatherInfoView *)infoView;


@end

@interface LZWeatherInfoView : UIView

@property (nonatomic, strong) LZWeatherInfo *weatherInfo;
@property (nonatomic, strong) LZForecastInfo *forecastInfo;

@property (nonatomic, weak) id<LZWeatherInfoViewProtocal> delegate;

- (void)buildview;

- (void)show;

- (void)hide;
@end
